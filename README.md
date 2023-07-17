[Reference-Project](https://github.com/Fay-Ho/Reference-Project)
---
A mobile weather application, the reference project for mobile app development.

- Using `AMap.Weather` API

- Project Tree
    
    - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/README.md)

    - [Reference-Android-Annotation-Project/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Annotation-Project)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-Android-Annotation-Project/README.md)

        - [Reference-Android-Annotation-Project-One-Android-Library/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Annotation-Project/Reference-Android-Annotation-Project-One-Android-Library)

        - [Reference-Android-Annotation-Project-One-Java-Library/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Annotation-Project/Reference-Android-Annotation-Project-One-Java-Library)

        - [Reference-Android-Annotation-Project-Two-Java-Library/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Annotation-Project/Reference-Android-Annotation-Project-Two-Java-Library)

    - [Reference-Android-Project/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-Android-Project/README.md)

        - [Reference-Android-Project-Java/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project/Reference-Android-Project-Java)

        - [Reference-Android-Project-Kotlin/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project/Reference-Android-Project-Kotlin)

    - [Reference-Data-Model-Generator/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Data-Model-Generator)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-Data-Model-Generator/README.md)

    - [Reference-Parcelize-Annotation/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Parcelize-Annotation)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-Parcelize-Annotation/README.md)

        - [Reference-Parcelize-Annotation-Generator/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Parcelize-Annotation/Reference-Parcelize-Annotation-Generator)

        - [Reference-Parcelize-Annotation-Plugin/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Parcelize-Annotation/Reference-Parcelize-Annotation-Plugin)

    - [Reference-VIP-Feature-Generator/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-VIP-Feature-Generator)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-VIP-Feature-Generator/README.md)

    - [Reference-iOS-Project/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-iOS-Project)

        - [README.md](https://github.com/Fay-Ho/Reference-Project/blob/develop/Reference-iOS-Project/README.md)

        - [Reference-iOS-Project-ObjC/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-iOS-Project/Reference-iOS-Project-ObjC)

        - [Reference-iOS-Project-Swift/](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-iOS-Project/Reference-iOS-Project-Swift)


### [Reference-Android-Annotation-Project](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Annotation-Project)

The **`Android`** project for generate annotation and annotation processor.


### [Reference-Android-Project](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project)

The **`Android`** project for the weather app building with **`MVVM`** architecture.


### [Reference-Data-Model-Generator](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Data-Model-Generator)

The **`Perl`** project for auto generate data model.

- **Java**

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

- **Kotlin**

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

- **Objective-C**

```objective-c
// FRModel.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRModel : NSObject

@property (nonatomic, strong, readonly, nonnull) NSString *string;
@property (nonatomic, strong, readonly, nonnull) NSArray<NSString *> *strings;

@end

NS_ASSUME_NONNULL_END

```

```objective-c
// FRModel.m

#import "FRModel.h"

@implementation FRModel

@property (nonatomic, strong, readwrite, nonnull) NSString *string;
@property (nonatomic, strong, readwrite, nonnull) NSArray<NSString *> *strings;

@end

```

- **Swift**

```swift
// Model.swift

struct Model: Codable {
    let string: String
    let strings: [String]
}

```


### [Reference-Parcelize-Annotation](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Parcelize-Annotation)

The **`Android`** project. The **`Java`** project.


### [Reference-VIP-Feature-Generator](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-VIP-Feature-Generator)

The **`JavaScript`** project for auto generate **`iOS VIP`** module.

#### Objective-C

- **FeatureConfigurator**

```objective-c
// FeatureConfigurator.h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FRFeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithDataModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END

```

- **Configurator**

```objective-c
// Configurator.h

#import <Foundation/Foundation.h>
#import "FRFeatureConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSampleConfigurator : NSObject <FRFeatureConfigurator>

@end

NS_ASSUME_NONNULL_END

```

```objective-c
// Configurator.m

#import "FRSampleConfigurator.h"
#import "FRSampleInteractor.h"
#import "FRSamplePresenter.h"
#import "FRSampleViewController.h"

@implementation FRSampleConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithDataModel:(id)model {
    FRSampleInteractor *interactor = [[FRSampleInteractor alloc] init];
    FRSamplePresenter *presenter = [[FRSamplePresenter alloc] init];
    FRSampleViewController *viewController = [[FRSampleViewController alloc] init];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end

```

- **Interactor**

```objective-c
// Interactor.h

#import <Foundation/Foundation.h>
#import "FRSampleInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSampleInteractor : NSObject <FRSampleInteractorInterface>

@property (nonatomic, strong) id<FRSamplePresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END

```

```objective-c
// Interactor.m

#import "FRSampleInteractor.h"

@implementation FRSampleInteractor

#pragma mark - FRSampleInteractorInterface Implementation

@end

```

- **Interface**

```objective-c
// Interface.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FRSampleInteractorInterface <NSObject>

@end

@protocol FRSamplePresenterInterface <NSObject>

@end

@protocol FRSampleViewControllerInterface <NSObject>

@end

NS_ASSUME_NONNULL_END

```

- **Presenter**

```objective-c
// Presenter.h

#import <Foundation/Foundation.h>
#import "FRSampleInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSamplePresenter : NSObject <FRSamplePresenterInterface>

@property (nonatomic, weak) id<FRSampleViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END

```

```objective-c
// Presenter.m

#import "FRSamplePresenter.h"

@implementation FRSamplePresenter

#pragma mark - FRSamplePresenterInterface Implementation

@end

```

- **ViewController**

```objective-c
// ViewController.h

#import <UIKit/UIKit.h>
#import "FRSampleInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSampleViewController : UIViewController <FRSampleViewControllerInterface>

@property (nonatomic, strong) id<FRSampleInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END

```

```objective-c
// ViewController.m

#import "FRSampleViewController.h"

@interface FRSampleViewController ()

@end

@implementation FRSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - FRSampleViewControllerInterface Implementation

@end

```

#### Swift

- **FeatureConfigurator**

```swift
// FeatureConfigurator.swift

import UIKit

protocol FeatureConfigurator {
    func makeViewController(dataModel model: Codable?) -> UIViewController
}

```

- **Configurator**

```swift
// Configurator.swift

import UIKit

class SampleConfigurator : FeatureConfigurator {
    func makeViewController(dataModel model: Codable?) -> UIViewController {
        let interactor = SampleInteractor()
        let presenter = SamplePresenter()
        let viewController = SampleViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}

```

- **Interactor**

```swift
// Interactor.swift

class SampleInteractor {
    var presenter: SamplePresenterInterface?
}

extension SampleInteractor : SampleInteractorInterface {}

```

- **Interface**

```swift
// Interface.swift

import Foundation

protocol SampleInteractorInterface {}

protocol SamplePresenterInterface {}

protocol SampleViewControllerInterface: NSObject {}

```

- **Presenter**

```swift
// Presenter.swift

class SamplePresenter {
    weak var viewController: SampleViewControllerInterface?
}

extension SamplePresenter : SamplePresenterInterface {}

```

- **ViewController**

```swift
// ViewController.swift

import UIKit

class SampleViewController : UIViewController {
    var interactor: SampleInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SampleViewController : SampleViewControllerInterface {}

```


### [Reference-iOS-Project](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-iOS-Project)

The **`iOS`** project for the weather app building with **`VIP`** architecture..
