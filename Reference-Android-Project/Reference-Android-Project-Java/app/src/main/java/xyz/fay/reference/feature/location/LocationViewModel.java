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

import androidx.annotation.Nullable;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import java.util.ArrayList;
import java.util.List;

import xyz.fay.reference.networking.response.GetCityCitiesResponse;
import xyz.fay.reference.networking.response.GetCityResponse;

public class LocationViewModel extends ViewModel {
    private final MutableLiveData<LocationDataModel> locationDataModel = new MutableLiveData<>();

    public MutableLiveData<LocationDataModel> getLocationDataModel() {
        return locationDataModel;
    }

    void handleGetCityResponse(@Nullable GetCityResponse response) {
        if (response != null) {
            List<LocationRowDataModel> rows = new ArrayList<>();
            for (GetCityCitiesResponse getCityCitiesResponse : response.getCities()) {
                LocationRowDataModel row = new LocationRowDataModel(getCityCitiesResponse.getName());
                rows.add(row);
            }
            LocationDataModel dataModel = new LocationDataModel(rows.toArray(new LocationRowDataModel[0]));
//            List<GetCityCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(getCityCitiesResponse -> {
//                return new LocationRowDataModel(getCityCitiesResponse.getName());
//            }).toArray(LocationRowDataModel[]::new));
            locationDataModel.postValue(dataModel);
        }
    }
}
