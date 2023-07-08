package xyz.fay.tools

data class Pair<T, U>(val first: T, val second: U)

data class Triple<T, U, V>(val first: T, val second: U, val third: V)

internal inline val <reified T> T.getClass: Class<T>
    get() = T::class.java
