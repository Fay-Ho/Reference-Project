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
import androidx.lifecycle.Observer;
import androidx.navigation.NavController;
import androidx.navigation.fragment.NavHostFragment;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import xyz.fay.reference.common.BaseFragment;
import xyz.fay.reference.common.BindingCreator;
import xyz.fay.reference.common.OnBackPressedListener;
import xyz.fay.reference.databinding.LocationFragmentBinding;

public class LocationFragment extends BaseFragment<LocationFragmentBinding, LocationViewModel> implements OnBackPressedListener {
    //region --- Override Methods ---

    @NonNull
    @Override
    protected BindingCreator<LocationFragmentBinding> getBindingCreator() {
        return new BindingCreator<LocationFragmentBinding>() {
            @Override
            public LocationFragmentBinding onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent) {
                return LocationFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
            }
        };
    }

    @NonNull
    @Override
    protected Class<LocationViewModel> createViewModel() {
        return LocationViewModel.class;
    }

    //endregion

    //region --- View Lifecycle ---

    @Override
    public void onCreateView() {
        getViewModel().getLocationDataModel().observe(getViewLifecycleOwner(), new Observer<LocationDataModel>() {
            @Override
            public void onChanged(LocationDataModel dataModel) {
                getBinding().recyclerView.setLayoutManager(new LinearLayoutManager(requireContext()));
                getBinding().recyclerView.setAdapter(new LocationAdapter(dataModel));
            }
        });
        LocationFragmentArgs args = LocationFragmentArgs.fromBundle(requireArguments());
        getViewModel().handleGetCityListResponse(args.getResponse());
    }

    //endregion

    //region --- Event Management ---

    @Override
    public void onPop() {
        NavController navController = NavHostFragment.findNavController(this);
        navController.popBackStack();
    }

    //endregion
}
