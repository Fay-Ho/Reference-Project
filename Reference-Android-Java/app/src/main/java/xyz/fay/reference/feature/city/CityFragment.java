package xyz.fay.reference.feature.city;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import xyz.fay.reference.common.BaseFragment;
import xyz.fay.reference.databinding.CityFragmentBinding;

public final class CityFragment extends BaseFragment<CityFragmentBinding, CityViewModel> {
    @NonNull
    @Override
    protected CityFragmentBinding createViewBinding(LayoutInflater inflater, ViewGroup container) {
        return CityFragmentBinding.inflate(inflater, container, false);
    }

    @NonNull
    @Override
    protected Class<CityViewModel> createViewModel() {
        return CityViewModel.class;
    }

    @Override
    protected void onCreateView() {
        CityFragmentArgs args = CityFragmentArgs.fromBundle(requireArguments());
        binding.recyclerView.setLayoutManager(new LinearLayoutManager(requireContext()));
        binding.recyclerView.setAdapter(new CityAdapter(args.getModels(), new CityAdapter.OnClickListener() {
            @Override
            public void onClick() {}
        }));
//        binding.recyclerView.setAdapter(new CityAdapter(args.getModels(), () -> {}));
    }
}
