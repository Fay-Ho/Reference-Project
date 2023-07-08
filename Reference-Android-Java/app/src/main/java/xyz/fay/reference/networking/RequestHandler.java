package xyz.fay.reference.networking;

import android.os.Parcelable;

import androidx.annotation.Nullable;

public interface RequestHandler<R extends Parcelable> {
    void completion(@Nullable R response);
}
