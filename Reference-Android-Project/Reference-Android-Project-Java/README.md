[Reference-Android-Project-Java](https://github.com/Fay-Ho/Reference-Project/tree/develop/Reference-Android-Project/Reference-Android-Project-Java)
---

### Replaceable
---

- `BaseFragment`

```
public abstract class BaseFragment<VB extends ViewBinding, VM extends ViewModel> extends Fragment {
    // Implementation 1
//    private final BindingCreator<VB> bindingCreator;

    // Implementation 1
//    public BaseFragment(BindingCreator<VB> bindingCreator) {
//        this.bindingCreator = bindingCreator;
//    }

    // Implementation 2
//    @NonNull
//    protected abstract VB createViewBinding(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @NonNull Boolean attachToParent);

    // Implementation 3
    @NonNull
    protected abstract BindingCreator<VB> getBindingCreator();

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        binding = getBindingCreator().onCreate(inflater, container, false);

        // Implementation 1
//        binding = bindingCreator.onCreate(inflater, container, false);

        // Implementation 2
//        binding = createViewBinding(inflater, container, false);

		// Implementation 3
		binding = getBindingCreator().onCreate(inflater, container, false);

        // Implementation 4
//        Type superClass = getClass().getGenericSuperclass();
//        Class<?> cls = (Class<?>) ((ParameterizedType) superClass).getActualTypeArguments()[0];
//        try {
//            Method method = cls.getDeclaredMethod("inflate", LayoutInflater.class, ViewGroup.class, Boolean.class);
//            binding = (VB) method.invoke(null, inflater, container, false);
//        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
//            e.printStackTrace();
//        }
    }
}
```

- `LocationViewModel`

```
public class LocationViewModel extends ViewModel {
    public void handleCityResponse(@Nullable CityResponse response) {
        if (response != null) {
            // Implementation 1
//            List<LocationRowDataModel> rowDataModels = new ArrayList<>();
//            for (CityCitiesResponse response1 : response.getCities()) {
//                rowDataModels.add(new LocationRowDataModel(response1.getName()));
//            }
//            locationDataModel.postValue(new LocationDataModel(rowDataModels.toArray(new LocationRowDataModel[0])));

            // Implementation 2
//            List<CityCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> {
//                return new LocationRowDataModel(response1.getName());
//            }).toArray(rowDataModels -> {
//                return new LocationRowDataModel[rowDataModels];
//            }));
//            locationDataModel.postValue(dataModel);

            // Implementation 3
//            List<CityCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> {
//                return new LocationRowDataModel(response1.getName());
//            }).toArray(rowDataModels -> new LocationRowDataModel[rowDataModels]));
//            locationDataModel.postValue(dataModel);

            // Implementation 4
//            List<CityCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> new LocationRowDataModel(response1.getName())).toArray(rowDataModels -> new LocationRowDataModel[rowDataModels]));
//            locationDataModel.postValue(dataModel);

            // Implementation 5
//            List<CityCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(this::createRowDataModel).toArray(LocationRowDataModel[]::new));
//            locationDataModel.postValue(dataModel);
        }
    }

    // Implementation 5
    @NonNull
    private LocationRowDataModel createRowDataModel(@NonNull CityCitiesResponse response) {
        return new LocationRowDataModel(response.getName());
    }
}
```

- `WeatherFragment`

```
public class WeatherFragment extends BaseFragment<WeatherFragmentBinding, WeatherViewModel> {
    // Implementation 1
//    WeatherFragment() {
        // Implementation 1-1
//        super(new BindingCreator<WeatherFragmentBinding>() {
//            @Override
//            public WeatherFragmentBinding onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent) {
//                return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//            }
//        });

        // Implementation 1-2
//        super((layoutInflater, viewGroup, attachToParent) -> {
//            return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//        });

        // Implementation 1-3
//        super((layoutInflater, viewGroup, attachToParent) -> WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent));

        // Implementation 1-4
//        super(WeatherFragmentBinding::inflate);
//    }

    // Implementation 2
//    @NonNull
//    @Override
//    protected WeatherFragmentBinding createViewBinding(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @NonNull Boolean attachToParent) {
//        return WeatherFragmentBinding.inflate(inflater, container, attachToParent);
//    }

    // Implementation 3
    @NonNull
    @Override
    protected BindingCreator<WeatherFragmentBinding> getBindingCreator() {
        // Implementation 3-1
//        return new BindingCreator<WeatherFragmentBinding>() {
//            @Override
//            public WeatherFragmentBinding onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent) {
//                return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//            }
//        };

        // Implementation 3-2
//        return (layoutInflater, viewGroup, attachToParent) -> {
//            return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//        };

        // Implementation 3-3
//        return (layoutInflater, viewGroup, attachToParent) -> WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);

        // Implementation 3-4
        return WeatherFragmentBinding::inflate;
    }

    @Override
    public void onCreateView() {
        // Implementation 5-1
//        getViewModel().getWeatherDataModel().observe(getViewLifecycleOwner(), new Observer<WeatherDataModel>() {
//            @Override
//            public void onChanged(WeatherDataModel dataModel) {}
//        });

        // Implementation 5-2
        getViewModel().getWeatherDataModel().observe(getViewLifecycleOwner(), dataModel -> {});
    }

    private void setupImageView() {
        // Implementation 6-1
//        getBinding().imageView.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                getViewModel().getCityResponse().observe(getViewLifecycleOwner(), new Observer<CityResponse>() {
//                    @Override
//                    public void onChanged(CityResponse response) {}
//                });
//            }
//        });

        // Implementation 6-2
        getBinding().imageView.setOnClickListener(v -> {
            getViewModel().getCityResponse().observe(getViewLifecycleOwner(), response -> {});
        });
    }
}
```

- `WeatherViewModel`

```
public class WeatherViewModel extends ViewModel {
    public void viewIsReady() {
        // Implementation 1-1
//        new NetworkManager().getWeather(this::handleWeatherResponse);

        // Implementation 1-2
        new NetworkManager().getWeather(response -> {
            if (response == null) { return; }

            WeatherListItemDataModel[] listItems = Arrays
                    .stream(response.getList())
                    .map(this::createListItemDataModel)
                    .toArray(WeatherListItemDataModel[]::new);

            WeatherListResponse listResponse = Arrays2.firstOrNull(Arrays.asList(response.getList()));

            if (listResponse == null) { return; }

            WeatherListWeatherResponse weatherResponse = Arrays2.firstOrNull(Arrays.asList(listResponse.getWeather()));

            if (weatherResponse == null) { return; }

            WeatherDataModel dataModel = new WeatherDataModel(
                    listResponse.getMain().getTemp().toString(),
                    weatherResponse.getMain(),
                    listResponse.getWind().getDeg().toString(),
                    listItems
            );

            weatherDataModel.postValue(dataModel);
        });
    }

    public void fetchCityList(Context context) {
        NetworkManager manager = new NetworkManager();
        
        // `setValue()` can only run in main thread, `postValue()` can run in all thread.

        // Implementation 2-1
//        manager.getCity(new RequestHandler<CityResponse>() {
//            @Override
//            public void completion(@Nullable CityResponse response) {
//                if (response != null) {
//                    cityResponse.setValue(response);
//                    cityResponse.postValue(response);
//                }
//            }
//        });
        
        // Implementation 2-2
//        manager.getCity(response -> {
//            if (response != null) {
//                cityResponse.setValue(response);
//                cityResponse.postValue(response);
//            }
//        });
        
        // Implementation 2-3
        manager.getCity(cityResponse::setValue);
        manager.getCity(cityResponse::postValue);
    }

    // Implementation 1-1
//    private void handleWeatherResponse(@Nullable WeatherResponse response) {
//        if (response == null) { return; }
//
//        WeatherListItemDataModel[] listItems = Arrays
//                .stream(response.getList())
//                .map(this::createListItemDataModel)
//                .toArray(WeatherListItemDataModel[]::new);
//
//        WeatherListResponse listResponse = Arrays2.firstOrNull(Arrays.asList(response.getList()));
//
//        if (listResponse == null) { return; }
//
//        WeatherListWeatherResponse weatherResponse = Arrays2.firstOrNull(Arrays.asList(listResponse.getWeather()));
//
//        if (weatherResponse == null) { return; }
//
//        WeatherDataModel dataModel = new WeatherDataModel(
//                listResponse.getMain().getTemp().toString(),
//                weatherResponse.getMain(),
//                listResponse.getWind().getDeg().toString(),
//                listItems
//        );
//
//        weatherDataModel.postValue(dataModel);
//    }
}
```

- `ImageProvider`

```
public enum ImageProvider {
	@Nullable
    public static ImageProvider rawValue(@NonNull String rawValue) {
    	// Implementation 1
//        for (ImageProvider imageProvider : values()) {
//            if (imageProvider.rawValue.equals(rawValue)) {
//                return imageProvider;
//            }
//        }
//        return null;

		// Implementation 2
		return Arrays.stream(values())
                .filter(imageProvider -> imageProvider.rawValue.equals(rawValue))
                .findFirst()
                .orElse(null);
    }
}
```

- `MainActivity`

```
public final class MainActivity extends AppCompatActivity {
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        Fragment hostFragment = getSupportFragmentManager().getFragments().get(0);
        if (hostFragment instanceof NavHostFragment) {
            // Implementation 1
//            hostFragment.getChildFragmentManager().getFragments().forEach(new Consumer<Fragment>() {
//                @Override
//                public void accept(Fragment fragment) {
//                    if (fragment instanceof OnBackPressedListener) {
//                        ((OnBackPressedListener) fragment).onPop();
//                    }
//                }
//            });

            // Implementation 2
            hostFragment.getChildFragmentManager().getFragments().forEach(fragment -> {
                if (fragment instanceof OnBackPressedListener) {
                    ((OnBackPressedListener) fragment).onPop();
                }
            });
        }
        return super.onOptionsItemSelected(item);
    }
}
```
