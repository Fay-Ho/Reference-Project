package xyz.fay.reference.feature.city

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import xyz.fay.reference.databinding.CityAdapterBinding
import xyz.fay.reference.networking.response.GetCityCitiesResponse

class CityAdapter(
    private val models: Array<GetCityCitiesResponse>,
    private val onClick: () -> Unit

) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder =
        ViewHolder(CityAdapterBinding.inflate(LayoutInflater.from(parent.context), parent, false))

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        (holder as ViewHolder).apply {
            itemView.setOnClickListener {
                onClick()
            }
            nameView.text = models[position].name
        }
    }

    override fun getItemCount() = models.count()

    private inner class ViewHolder(binding: CityAdapterBinding): RecyclerView.ViewHolder(binding.root) {
        val nameView = binding.nameView
    }
}
