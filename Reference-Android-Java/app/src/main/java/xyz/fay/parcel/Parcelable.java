package xyz.fay.parcel;

import android.os.Parcel;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class Parcelable implements android.os.Parcelable {
    @Override
    public void writeToParcel(Parcel dest, int flags) {
        try {
            Class<? extends Parcelable> cls = getClass();
            dest.writeString(cls.getName());
            Field[] declaredFields = cls.getDeclaredFields();
            for (Field field : declaredFields) {
                int modifiers = field.getModifiers();
                if (!Modifier.isStatic(modifiers) && !Modifier.isTransient(modifiers)) {
                    field.setAccessible(true);
                    dest.writeValue(field.get(this));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<? extends Parcelable> CREATOR = new Creator<Parcelable>() {
        @Override
        public Parcelable createFromParcel(Parcel in) {
            try {
                String name = in.readString();
                Class<?> cls = Class.forName(name);
                Object object = cls.newInstance();
                Field[] fields = cls.getDeclaredFields();
                for (Field field : fields) {
                    int modifiers = field.getModifiers();
                    if (!Modifier.isStatic(modifiers) && !Modifier.isTransient(modifiers)) {
                        field.setAccessible(true);
                        field.set(object, in.readValue(cls.getClassLoader()));
                    }
                }
                return (Parcelable) object;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        public Parcelable[] newArray(int size) {
            return new Parcelable[size];
        }
    };
}
