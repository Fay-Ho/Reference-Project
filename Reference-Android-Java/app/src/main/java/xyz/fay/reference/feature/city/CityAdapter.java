package xyz.fay.reference.feature.city;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import xyz.fay.reference.databinding.CityAdapterBinding;
import xyz.fay.reference.networking.response.CityListResponse;

public class CityAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private final List<CityListResponse> cities;
    private final OnClickListener onClickListener;

    public CityAdapter(List<CityListResponse> cities, OnClickListener onClickListener) {
        this.cities = cities;
        this.onClickListener = onClickListener;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(CityAdapterBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onClickListener.onClick();
            }
        });
//        holder.itemView.setOnClickListener(v -> {
//            onClickListener.onClick();
//        });
        ((ViewHolder) holder).nameView.setText(cities.get(position).getName());
    }

    @Override
    public int getItemCount() {
        return cities.size();
    }

    private static class ViewHolder extends RecyclerView.ViewHolder {
        private final TextView nameView;

        private ViewHolder(@NonNull CityAdapterBinding binding) {
            super(binding.getRoot());
            nameView = binding.nameView;
        }
    }

    interface OnClickListener {
        void onClick();
    }
}