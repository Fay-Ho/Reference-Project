package xyz.fay.reference.feature.location;

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
import androidx.annotation.Nullable;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import java.util.Arrays;
import java.util.List;

import xyz.fay.reference.networking.response.GetCityListCitiesResponse;
import xyz.fay.reference.networking.response.GetCityListResponse;

public class LocationViewModel extends ViewModel {
    private final MutableLiveData<LocationDataModel> locationDataModel = new MutableLiveData<>();

    public MutableLiveData<LocationDataModel> getLocationDataModel() {
        return locationDataModel;
    }

    public void handleGetCityListResponse(@Nullable GetCityListResponse response) {
        if (response != null) {
            List<GetCityListCitiesResponse> responses = Arrays.asList(response.getCities());
            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(LocationViewModel::apply).toArray(LocationRowDataModel[]::new));
            locationDataModel.postValue(dataModel);
        }
    }

    @NonNull
    private static LocationRowDataModel apply(@NonNull GetCityListCitiesResponse response) {
        return new LocationRowDataModel(response.getName());
    }
}
