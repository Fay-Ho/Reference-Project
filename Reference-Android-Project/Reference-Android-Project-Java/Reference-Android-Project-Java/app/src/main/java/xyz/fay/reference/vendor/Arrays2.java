package xyz.fay.reference.vendor;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Iterator;

public class Arrays2 {
    @Nullable
    public static <T> T firstOrNull(@NonNull Iterable<T> iterable) {
        Iterator<T> iterator = iterable.iterator();
        return iterator.hasNext() ? iterator.next() : null;
    }
}
