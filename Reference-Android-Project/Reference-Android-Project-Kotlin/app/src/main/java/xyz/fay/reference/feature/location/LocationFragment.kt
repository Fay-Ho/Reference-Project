package xyz.fay.reference.feature.location

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
import androidx.navigation.fragment.navArgs
import androidx.recyclerview.widget.LinearLayoutManager
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.common.OnBackPressedListener
import xyz.fay.reference.databinding.LocationFragmentBinding

class LocationFragment : BaseFragment<LocationFragmentBinding, LocationViewModel>(), OnBackPressedListener {
    //region --- ViewBinding / ViewModel ---

    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?) =
        LocationFragmentBinding.inflate(inflater, container, false)

    override fun createViewModel() =
        LocationViewModel::class

    //endregion

    //region --- View Lifecycle ---

    override fun onCreateView() {
        viewModel.adapterDataModel.observe(viewLifecycleOwner) {
            binding.recyclerView.layoutManager = LinearLayoutManager(requireContext())
            binding.recyclerView.adapter = LocationAdapter(it)
        }
        val args: LocationFragmentArgs by navArgs()
        viewModel.handleGetCityResponse(args.response)
    }

    //endregion

    //region --- Event Management ---

    override fun pop() {
        findNavController().popBackStack()
    }

    //endregion
}
