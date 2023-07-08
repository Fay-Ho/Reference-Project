package xyz.fay.reference

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import androidx.navigation.fragment.NavHostFragment
import xyz.fay.reference.common.OnBackPressedListener
import xyz.fay.reference.databinding.MainActivityBinding

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = MainActivityBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.run {
            setHomeButtonEnabled(true)
            setDisplayHomeAsUpEnabled(true)
        }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        supportFragmentManager.fragments.apply {
            first().apply {
                if (this is NavHostFragment) {
                    childFragmentManager.fragments.forEach {
                        if (it is OnBackPressedListener) {
                            it.pop()
                        }
                    }
                }
            }
        }
        return super.onOptionsItemSelected(item)
    }
}
