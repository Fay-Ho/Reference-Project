Reference-Project
---

A mobile weather application, the reference project for mobile app development.

- Using `AMap.Weather` API

#### Reference-Android-Java
---
The `Java` project for the weather app building with `MVVM` architecture.

```java


```

#### Reference-Android-Kotlin
---
The `Kotlin` project for the weather app building with `MVVM` architecture.

```kotlin


```

#### Reference-iOS-ObjC
---
The `Objective-C` project for the weather app building with `VIP` architecture.

```objective-c


```

#### Reference-iOS-Swift
---
The `Swift` project for the weather app building with `VIP` architecture.

```swift


```

#### Reference-Model-Generator
---
The `Perl` project for auto generate data model.

The sample

- Java (Model.java)

- Kotlin (Model.kotlin)

- Objective-C (FRModel.h, FRModel.m)

- Swift (Model.swift)

#### Reference-Parcelize-Plugin
---
The `Intellij IDEA` / `Android Studio` plugin project for solve the code show error where `Java` project using `@Parcelize` `(xyz.fay.parcel.Parcelize)` annotation.

- `@Parcelize` annotation is using for auto generate `Getter` / `Setter` method in Java.

```java
import xyz.fay.parcel.Parcelize

@Parcelize
public final class Person {
	private final String name;

	public Person(String name) {
		this.name = name;
	}

	// Will auto generate `Getter` method here when java compile.
}
```
