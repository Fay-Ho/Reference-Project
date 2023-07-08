package xyz.fay.reference.utils

internal inline val <reified T> T.getClass: Class<T>
    get() = T::class.java
