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

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.databinding.WeatherFragmentBinding

class WeatherFragment : BaseFragment<WeatherFragmentBinding, WeatherViewModel>() {
    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?) =
        WeatherFragmentBinding.inflate(inflater, container, false)

    override fun createViewModel() =
        WeatherViewModel::class

    override fun onCreateView() {
        hideActionBar()
        setupSubviews()
    }

    override fun onDestroyView() {
        super.onDestroyView()
        showActionBar()
    }

    fun setupSubviews() {
        setupImageView()
    }

    fun setupImageView() {
        binding.imageView.setOnClickListener {
            observeGetCityResponse()
            viewModel.fetchData(requireContext())
        }
    }

    fun observeGetCityResponse() {
        viewModel.getCityResponse.observe(viewLifecycleOwner) {
            findNavController().navigate(WeatherFragmentDirections.actionWeatherFragmentToLocationFragment(it))
        }
    }
}
