package xyz.fay.reference.feature.weather

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

import androidx.navigation.fragment.findNavController
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.databinding.WeatherFragmentBinding
import xyz.fay.reference.utils.ImageProvider

class WeatherFragment : BaseFragment<WeatherFragmentBinding, WeatherViewModel>(WeatherFragmentBinding::inflate) {
    //region --- Override Methods ---

//    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?, attachToParent: Boolean) =
//        WeatherFragmentBinding.inflate(inflater, container, attachToParent)

    override fun createViewModel() =
        WeatherViewModel::class

    //endregion

    //region --- View Lifecycle ---

    override fun onCreateView() {
        hideActionBar()
        setupSubviews()
        viewModel.weatherDataModel.observe(viewLifecycleOwner) {
            binding.temperatureView.text = it.temperature
            binding.weatherView.text = it.weather
            binding.windView.text = it.wind
        }
        viewModel.viewIsReady(requireContext())
    }

    override fun onDestroyView() {
        super.onDestroyView()
        showActionBar()
    }

    //endregion

    //region --- Subview Management ---

    private fun setupSubviews() {
        setupImageView()
    }

    private fun setupImageView() {
        binding.imageView.setImageDrawable(ImageProvider.LOCATION.loadImage(requireContext()))
        binding.imageView.setOnClickListener {
            viewModel.getCityResponse.observe(viewLifecycleOwner) {
                findNavController().navigate(WeatherFragmentDirections.actionWeatherFragmentToLocationFragment(it))
            }
            viewModel.fetchCityData(requireContext())
        }
    }

    //endregion
}
