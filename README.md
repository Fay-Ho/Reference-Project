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

### Reference-iOS-Feature-Generator
---
The `JavaScript` project for auto generate iOS VIP module.

- Objective-C

```objective-c
// Configurator

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRConfigurator : NSObject

+ (instancetype)configurator;

- (UIViewController *)makeViewController;

@end

NS_ASSUME_NONNULL_END


#import "FRConfigurator.h"
#import "FRInteractor.h"
#import "FRPresenter.h"
#import "FRViewController.h"

@implementation FRConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewController {
    FRInteractor *interactor = [[FRInteractor alloc] init];
    FRPresenter *presenter = [[FRPresenter alloc] init];
    FRViewController *viewController = [[FRViewController alloc] init];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
```

```objective-c
// Interactor

#import <Foundation/Foundation.h>
#import "FRInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRInteractor : NSObject <FRInteractorInterface>

@property (nonatomic, strong) id<FRPresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END


#import "FRInteractor.h"

@implementation FRInteractor

@end
```

```objective-c
// Interface

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FRInteractorInterface <NSObject>

@end

@protocol FRPresenterInterface <NSObject>

@end

@protocol FRViewControllerInterface <NSObject>

@end

NS_ASSUME_NONNULL_END
```

```objective-c
// Presenter

#import <Foundation/Foundation.h>
#import "FRInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRPresenter : NSObject <FRPresenterInterface>

@property (nonatomic, weak) id<FRViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END


#import FRPresenter.h"

@implementation FRPresenter

@end
```

```objective-c
// ViewController

#import <UIKit/UIKit.h>
#import FRInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRViewController : UIViewController <FRViewControllerInterface>

@property (nonatomic, strong) id<FRInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END


#import "FRViewController.h"

@interface FRViewController ()

@end

@implementation FRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
```

- Swift
```swift
// Configurator

import UIKit

func makeViewController() -> UIViewController {
    let interactor = Interactor()
    let presenter = Presenter()
    let viewController = ViewController()

    interactor.presenter = presenter
    presenter.viewController = viewController
    viewController.interactor = interactor

    return viewController
}
```

```swift
// Interactor

class Interactor : InteractorInterface {
    var presenter: PresenterInterface?
}

extension Interactor : InteractorInterface {}
```

```swift
// Interface

import Foundation

protocol InteractorInterface {}

protocol PresenterInterface {}

protocol ViewControllerInterface : NSObject {}
```

```swift
// Presenter

class Presenter : PresenterInterface {
    weak var viewController: ViewControllerInterface?
}

extension Presenter : PresenterInterface {}
```

```swift
// ViewController

import UIKit

class ViewController: UIViewController {
    var interactor: InteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: ViewControllerInterface {}
```

### Reference-Data-Model-Generator
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

### Reference-Parcelize-Annotation-Plugin
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
