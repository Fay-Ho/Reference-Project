package xyz.fay.reference.feature.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.databinding.HomeFragmentBinding
import kotlin.reflect.KClass

class HomeFragment : BaseFragment<HomeFragmentBinding, HomeViewModel>() {
    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?) =
            HomeFragmentBinding.inflate(inflater, container, false)

    override fun createViewModel(): KClass<HomeViewModel> =
            HomeViewModel::class

    override fun onCreateView() {
        setupSubview()
        observeCityResponse()
        observeWeatherResponse()
    }

    private fun setupSubview() {
        binding.button.setOnClickListener {
            viewModel.fetchCityData(requireContext())
        }
    }

    private fun observeCityResponse() {
        viewModel.cityResponse.observe(viewLifecycleOwner) {
            it?.let {
                val navController = findNavController()
                navController.navigate(HomeFragmentDirections.actionHomeFragmentToCityFragment(it.cities))
            }
        }
    }

    private fun observeWeatherResponse() {
        viewModel.weatherResponse.observe(viewLifecycleOwner) {}
        viewModel.fetchWeatherData(requireContext())
    }
}
