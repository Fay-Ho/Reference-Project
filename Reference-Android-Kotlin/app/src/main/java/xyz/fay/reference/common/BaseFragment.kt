package xyz.fay.reference.common

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.viewbinding.ViewBinding
import kotlin.reflect.KClass

abstract class BaseFragment<VB: ViewBinding, VM: ViewModel> : Fragment() {
    protected lateinit var binding: VB
    protected lateinit var viewModel: VM

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = createViewBinding(inflater, container)
        viewModel = ViewModelProvider(this)[createViewModel().java]
        onCreateView()
        return binding.root
    }

    protected abstract fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?): VB

    protected abstract fun createViewModel(): KClass<VM>

    protected abstract fun onCreateView()
}
