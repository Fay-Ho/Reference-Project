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
import androidx.recyclerview.widget.RecyclerView
import xyz.fay.reference.databinding.WeatherAdapterBinding
import xyz.fay.reference.utils.ImageProvider

class WeatherAdapter(private val dataModels: Array<WeatherListItemDataModel>) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder =
        ViewHolder(WeatherAdapterBinding.inflate(LayoutInflater.from(parent.context), parent, false))

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        (holder as ViewHolder).apply {
            titleTextView.text = dataModels[position].time
            imageView.setImageDrawable(ImageProvider.rawValue(dataModels[position].image)?.loadImage())
            contentTextView.text = dataModels[position].weather
        }
    }

    override fun getItemCount() =
        dataModels.size

    private class ViewHolder(binding: WeatherAdapterBinding) : RecyclerView.ViewHolder(binding.root) {
        val titleTextView = binding.titleTextView
        val imageView = binding.imageView
        val contentTextView = binding.contentTextView
    }
}