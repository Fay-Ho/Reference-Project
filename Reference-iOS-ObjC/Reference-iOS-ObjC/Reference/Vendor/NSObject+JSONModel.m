//
//  Copyright (c) 2019 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSObject+JSONModel.h"
#import <objc/runtime.h>

@implementation NSObject (JSONModel)

static const char * const kPropertyListKey = "PROPERTY_LIST_KEY";

@dynamic JSON;

#pragma mark - Life Cycle

// 初始化
- (instancetype)initWithJSON:(id)JSON
{
    self.JSON = JSON;
    return [self init];
}

// 初始化
+ (instancetype)modelWithJSON:(id)JSON
{
    return [[self alloc] initWithJSON:JSON];
}

// 初始化
+ (instancetype)model
{
    return [[self alloc] init];
}

#pragma mark - Setter/Getter Methods

// JSON 数据
- (id)JSON
{
    return [self createJSON];
}

// 设置 JSON 数据
- (void)setJSON:(id)JSON
{
    [self parseJSON:JSON];
}

#pragma mark - Private Methods

// 解析 JSON
- (void)parseJSON:(id)JSON
{
    NSArray *propertyList = [self propertyList];
     
    [JSON enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL * _Nonnull stop) {
        if ([self.codingKeys.allKeys containsObject:key]) {
            key = self.codingKeys[key];
        }
        
        if ([propertyList containsObject:key]) {
            
            // 字典类型
            if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [obj isKindOfClass:[NSDictionary class]]) {
                NSString *ivarType = self.unkeyedContainer[key];
                Class cls = NSClassFromString(ivarType);
                if (cls) {
                    id json = obj;
                    obj = [cls model];
                    [obj parseJSON:json];
                }
            }
            
            // 数组类型
            if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")] || [obj isKindOfClass:[NSArray class]]) {
                NSString *ivarType = self.unkeyedContainer[key];
                if (!ivarType) ivarType = key;
                Class cls = NSClassFromString(ivarType);
                NSMutableArray *models = [NSMutableArray array];
                for (id json in obj) {
                    if ([json isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [json isKindOfClass:[NSDictionary class]]) {
                        id model = [cls model];
                        [model parseJSON:json];
                        [models addObject:model];
                    } else {
                        [models addObject:json];
                    }
                }
                obj = models;
            }
            
            // 其它类型
            if (obj) [self setValue:obj forKey:key];
        }
    }];
}

// 创建 JSON
- (NSDictionary *)createJSON
{
    // 获取类的所有属性
    NSDictionary *propertyDictionary = [self dictionaryWithValuesForKeys:self.propertyList];
    
    // 深度读取
    NSMutableDictionary *JSON = [NSMutableDictionary dictionary];
    for (NSString *key in propertyDictionary) {
        if ([propertyDictionary[key] isKindOfClass:[NSNull class]]) {
            [JSON setValue:nil forKey:key];
        } else if (![NSStringFromClass([propertyDictionary[key] class]) hasPrefix:@"NS"] && ![NSStringFromClass([propertyDictionary[key] class]) hasPrefix:@"__NS"]) {
            [JSON setValue:[propertyDictionary[key] createJSON] forKey:key];
        } else if ([propertyDictionary[key] isKindOfClass:[NSArray class]]) {
            NSMutableArray *cls = [propertyDictionary[key] mutableCopy];
            [propertyDictionary[key] enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                cls[idx] = [obj createJSON];
            }];
            [JSON setValue:cls forKey:key];
        } else {
            [JSON setValue:propertyDictionary[key] forKey:key];
        }
    }
    
    return JSON;
}

// 获取属性列表
- (NSArray *)propertyList
{
    /* 获取关联对象 */
    NSArray *list = objc_getAssociatedObject(self, &kPropertyListKey);
    
    /* 如果有生成过列表, 直接返回 */
    if (list) return list;
    
    /**
     * 参数1: 要获取得类
     * 参数2: 类属性的个数指针
     * 返回值: 所有属性的数组, C 语言中, 数组的名字, 就是指向第一个元素的地址
     *
     * 成员变量:
     * class_copyIvarList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 方法:
     * class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 属性:
     * class_copyPropertyList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 协议:
     * class_copyProtocolList(__unsafe_unretained Class cls, unsigned int *outCount)
     */
    /* retain, creat, copy 需要 release */
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *mtArray = [NSMutableArray array];
    
    /* 遍历所有属性 */
    for (unsigned int i = 0; i < outCount; i++) {
        /* 从数组中取得属性 */
        objc_property_t property = propertyList[i];
        
        /* 从 property 中获得属性名称 */
        const char *propertyName_C = property_getName(property);
        
        /* 将 C 字符串转化成 OC 字符串 */
        NSString *propertyName_OC = [NSString stringWithCString:propertyName_C encoding:NSUTF8StringEncoding];
        [mtArray addObject:propertyName_OC];
    }
    
    /* 设置关联对象 */
    /**
     *  参数1: 对象self
     *  参数2: 动态添加属性的 key
     *  参数3: 动态添加属性值
     *  参数4: 对象的引用关系
     */
    objc_setAssociatedObject(self, &kPropertyListKey, mtArray.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    /* 释放 */
    free(propertyList);
    
    return mtArray.copy;
}

#pragma mark - Public Methods

- (NSDictionary *)unkeyedContainer
{
    return @{ /* Override */ };
}

- (NSDictionary *)codingKeys
{
    return @{ /* Override */ };
}

@end
