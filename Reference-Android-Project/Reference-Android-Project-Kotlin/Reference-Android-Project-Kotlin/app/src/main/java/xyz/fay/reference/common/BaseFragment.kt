package xyz.fay.reference.common

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

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import androidx.viewbinding.ViewBinding
import kotlin.reflect.KClass

abstract class BaseFragment<VB: ViewBinding, VM: ViewModel>(val bindingCreator: (LayoutInflater, ViewGroup?, Boolean) -> VB) : Fragment(), OnBackPressedListener {
    private var _binding: VB? = null
    protected val binding: VB get() = _binding!!

    protected lateinit var viewModel: VM

    //region --- View Lifecycle ---

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        _binding = bindingCreator(inflater, container, false)
        viewModel = ViewModelProvider(this)[createViewModel().java]
        onCreateView()
        return _binding?.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    //endregion

    //region --- Event Management ---

    protected fun hideActionBar() =
        (activity as AppCompatActivity).supportActionBar?.hide()

    protected fun showActionBar() =
        (activity as AppCompatActivity).supportActionBar?.show()

    override fun onPop() {
        findNavController().popBackStack()
    }

    //endregion

    //region --- Abstract Methods ---

    protected abstract fun createViewModel(): KClass<VM>

    abstract fun onCreateView()

    //endregion
}
