package xyz.fay.reference.vendor;

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

import androidx.annotation.NonNull;

import java.io.Serializable;

public final class Result<T> implements Serializable {
    private final T data;
    private final Throwable throwable;

    public Result(T data, Throwable throwable) {
        this.data = data;
        this.throwable = throwable;
    }

    public void onSuccess(Success<T> success) {
        if (data != null) {
            success.action(data);
        }
    }

    public void onFailure(Failure failure) {
        if (throwable != null) {
            failure.action(throwable);
        }
    }

    @NonNull
    public static <T> Result<T> success(@NonNull T data) {
        return new Result<>(data, null);
    }

    @NonNull
    public static <T> Result<T> failure(@NonNull Throwable throwable) {
        return new Result<>(null, throwable);
    }

    public interface Success<T> {
        void action(@NonNull T data);
    }

    public interface Failure {
        void action(@NonNull Throwable throwable);
    }
}
