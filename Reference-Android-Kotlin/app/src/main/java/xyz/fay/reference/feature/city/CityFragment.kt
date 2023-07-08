package xyz.fay.reference.feature.city

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.navigation.fragment.navArgs
import androidx.recyclerview.widget.LinearLayoutManager
import xyz.fay.reference.common.BaseFragment
import xyz.fay.reference.databinding.CityFragmentBinding
import kotlin.reflect.KClass

class CityFragment : BaseFragment<CityFragmentBinding, CityViewModel>() {
    private val args: CityFragmentArgs by navArgs()

    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?) =
            CityFragmentBinding.inflate(inflater, container, false)

    override fun createViewModel(): KClass<CityViewModel> =
            CityViewModel::class

    override fun onCreateView() {
        binding.recyclerView.layoutManager = LinearLayoutManager(requireContext())
        binding.recyclerView.adapter = CityAdapter(args.models) {}
    }
}
