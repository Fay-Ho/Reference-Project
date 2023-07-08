package xyz.fay.reference.feature.city

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import xyz.fay.reference.databinding.CityFragmentBinding

class CityFragment : Fragment() {
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val viewModel = ViewModelProvider(this)[CityViewModel::class.java]
        val binding = CityFragmentBinding.inflate(inflater, container, false)
        observeCityResponse(viewModel, binding)
        return binding.root
    }

    private fun observeCityResponse(viewModel: CityViewModel, binding: CityFragmentBinding) {
        viewModel.cityResponse.observe(viewLifecycleOwner) {
            binding.recyclerView.layoutManager = LinearLayoutManager(requireContext())
            binding.recyclerView.adapter = CityAdapter(it.cities) {
            }
        }
        viewModel.fetchData(requireContext())
    }
}
