package xyz.fay.reference.feature.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.databinding.WeatherFragmentBinding
import kotlin.reflect.KClass

class HomeFragment : BaseFragment<WeatherFragmentBinding, HomeViewModel>() {
    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?) =
            WeatherFragmentBinding.inflate(inflater, container, false)

    override fun createViewModel(): KClass<HomeViewModel> =
            HomeViewModel::class

    override fun onCreateView() {
        setupSubview()
        observeWeatherResponse()
    }

    private fun setupSubview() {
        binding.button.setOnClickListener {
            val navController = findNavController()
            navController.navigate(WeatherFragmentDirections.actionWeatherFragmentToCityFragment())
        }
    }

    private fun observeWeatherResponse() {
        viewModel.weatherResponse.observe(viewLifecycleOwner) {
        }
        viewModel.fetchData(requireContext())
    }
}
