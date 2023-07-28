package xyz.fay.annotation;

/*
  MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

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
