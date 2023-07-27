[Reference-Android-Project-Kotlin](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project/Reference-Android-Project-Kotlin)
---

### Replaceable
---

- `BaseFragment`

```
// Implementation 1
abstract class BaseFragment<VB: ViewBinding, VM: ViewModel>(val bindingCreator: (LayoutInflater, ViewGroup?, Boolean) -> VB) : Fragment() {
	// Implementation 2
//    protected abstract fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?, attachToParent: Boolean): VB

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        // Implementation 1
        _binding = bindingCreator(inflater, container, false)

        // Implementation 2
//        _binding = createViewBinding(inflater, container, false)

        // Implementation 3
//        val type = javaClass.genericSuperclass as ParameterizedType
//        val cls = type.actualTypeArguments[0] as Class<*>
//        val method = cls.getDeclaredMethod("inflate", LayoutInflater::class.java, ViewGroup::class.java, Boolean::class.java)
//        _binding = method.invoke(null, layoutInflater, container, false) as VB
    }
}
```

- `WeatherFragment`

```
// Implementation 1
class WeatherFragment : BaseFragment<WeatherFragmentBinding, WeatherViewModel>(WeatherFragmentBinding::inflate) {
	// Implementation 2
//    override fun createViewBinding(inflater: LayoutInflater, container: ViewGroup?, attachToParent: Boolean) =
//        WeatherFragmentBinding.inflate(inflater, container, attachToParent)
}
```

- `WeatherViewModel`

```
class WeatherViewModel : ViewModel() {
    fun fetchCityList(context: Context) {
        val manager = NetworkManager()

        // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用

        // Implementation 1
        manager.getCityList(context) {
            it?.let {
                // Implementation 1-1
                _getCityListResponse.value = it
                _getCityListResponse.postValue(it)

                // Implementation 1-2
                _getCityListResponse::setValue
                _getCityListResponse::postValue
            }
        }

        // Implementation 2
        manager.getCityList(context, _getCityListResponse::setValue)
        manager.getCityList(context, _getCityListResponse::postValue)
    }
}
```
