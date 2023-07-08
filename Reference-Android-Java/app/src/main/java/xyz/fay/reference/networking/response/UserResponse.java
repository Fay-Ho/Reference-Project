package xyz.fay.reference.networking.response;

import androidx.annotation.NonNull;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class UserResponse extends Parcelable {
    @NonNull private final String age;
    @NonNull private final String name;
    @NonNull private final String sex;

    public UserResponse(@NonNull String age, @NonNull String name, @NonNull String sex) {
        this.age = age;
        this.name = name;
        this.sex = sex;
    }
}
