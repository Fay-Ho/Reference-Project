//
//  FRCityInteractor.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityInteractor.h"
#import "FRNetworkManager.h"
#import "FRCityResponse.h"

@implementation FRCityInteractor

- (void)fetchData {
    FRNetworkManager<FRCityResponse *> *manager = [FRNetworkManager manager];
    [manager getCity:^(FRCityResponse * _Nullable response) {
        NSLog(@"%@", response.cities);
    }];
}

@end
