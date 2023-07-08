package xyz.fay.reference;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import android.os.Bundle;
import android.view.MenuItem;

import java.util.function.Consumer;

import xyz.fay.reference.common.OnBackPressedListener;
import xyz.fay.reference.databinding.MainActivityBinding;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MainActivityBinding binding = MainActivityBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        Fragment hostFragment = getSupportFragmentManager().getFragments().get(0);
        if (hostFragment instanceof NavHostFragment) {
            hostFragment.getChildFragmentManager().getFragments().forEach(new Consumer<Fragment>() {
                @Override
                public void accept(Fragment fragment) {
                    if (fragment instanceof OnBackPressedListener) {
                        ((OnBackPressedListener) fragment).pop();
                    }
                }
            });
//            hostFragment.getChildFragmentManager().getFragments().forEach(fragment -> {
//                if (fragment instanceof OnBackPressedListener) {
//                    ((OnBackPressedListener) fragment).pop();
//                }
//            });
        }
        return super.onOptionsItemSelected(item);
    }
}
