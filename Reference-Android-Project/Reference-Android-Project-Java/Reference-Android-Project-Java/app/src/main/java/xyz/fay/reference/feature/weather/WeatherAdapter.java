package xyz.fay.reference.feature.weather;

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

import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import xyz.fay.reference.databinding.WeatherAdapterBinding;

final class WeatherAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private final WeatherListItemDataModel[] dataModels;

    public WeatherAdapter(WeatherListItemDataModel[] dataModels) {
        this.dataModels = dataModels;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(WeatherAdapterBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        ViewHolder viewHolder = (ViewHolder) holder;
        viewHolder.imageView.setImageDrawable(dataModels[position].getImageProvider().loadImage());
        viewHolder.timeTextView.setText(dataModels[position].getTime());
        viewHolder.weatherTextView.setText(dataModels[position].getWeather());
    }

    @Override
    public int getItemCount() {
        return dataModels.length;
    }

    private static class ViewHolder extends RecyclerView.ViewHolder {
        private final ImageView imageView;
        private final TextView timeTextView;
        private final TextView weatherTextView;

        private ViewHolder(@NonNull WeatherAdapterBinding binding) {
            super(binding.getRoot());
            imageView = binding.imageView;
            timeTextView = binding.timeTextView;
            weatherTextView = binding.weatherTextView;
        }
    }
}
