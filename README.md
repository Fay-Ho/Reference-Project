Reference-Project
---

A mobile weather application, the reference project for mobile app development.

- Using `AMap.Weather` API

### Reference-Android-Java
---
The `Java` project for the weather app building with `MVVM` architecture.

```java


```

### Reference-Android-Kotlin
---
The `Kotlin` project for the weather app building with `MVVM` architecture.

```kotlin


```

### Reference-iOS-ObjC
---
The `Objective-C` project for the weather app building with `VIP` architecture.

```objective-c


```

### Reference-iOS-Swift
---
The `Swift` project for the weather app building with `VIP` architecture.

```swift


```

### Reference-Model-Generator
---
The `Perl` project for auto generate data model.


- Java

```java
// Model.java

package xyz.fay.reference;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class Model extends Parcelable {
    private final String string;
    private final String[] strings;

    public Model(String string, String[] strings) {
        this.string = string;
        this.strings = strings;
    }
}

```

- Kotlin

```kotlin
// Model.kt

package xyz.fay.reference

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Model(
        val string: String,
        val strings: Array<String>
) : Parcelable

```

- Objective-C

```objective-c
// FRModel.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRModel : NSObject

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSArray<NSString *> *strings;

@end

NS_ASSUME_NONNULL_END


// FRModel.m

#import "FRModel.h"

@implementation FRModel

@end
```

- Swift

```swift
// Model.swift

struct Model: Codable {
    let string: String
    let strings: [String]
}
```

### Reference-Parcelize-Plugin
---
The `Intellij IDEA` / `Android Studio` plugin project for solve the code show error where `Java` project using `@Parcelize` `(xyz.fay.parcel.Parcelize)` annotation.

- `@Parcelize` annotation is using for auto generate `Getter` / `Setter` method in Java.

```java
// Person.java

package xyz.fay.reference;

import xyz.fay.parcel.Parcelable;

@Parcelize
public final class Person {
    private final String name;
    private String age;

    public Person(String name) {
        this.name = name;
    }

    // Will auto generate `getName()` method here when java compile.

    // Will auto generate `getAge()` and `setAge(String age)` method here when java compile.
}
```
