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
public void handleGetCityListResponse(@Nullable GetCityListResponse response) {
        if (response != null) {
            // Implementation 1
//            List<LocationRowDataModel> rowDataModels = new ArrayList<>();
//            for (GetCityListCitiesResponse response1 : response.getCities()) {
//                rowDataModels.add(new LocationRowDataModel(response1.getName()));
//            }
//            locationDataModel.postValue(new LocationDataModel(rowDataModels.toArray(new LocationRowDataModel[0])));

            // Implementation 2
//            List<GetCityListCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> {
//                return new LocationRowDataModel(response1.getName());
//            }).toArray(rowDataModels -> {
//                return new LocationRowDataModel[rowDataModels];
//            }));
//            locationDataModel.postValue(dataModel);

            // Implementation 3
//            List<GetCityListCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> {
//                return new LocationRowDataModel(response1.getName());
//            }).toArray(rowDataModels -> new LocationRowDataModel[rowDataModels]));
//            locationDataModel.postValue(dataModel);

            // Implementation 4
//            List<GetCityListCitiesResponse> responses = Arrays.asList(response.getCities());
//            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(response1 -> new LocationRowDataModel(response1.getName())).toArray(rowDataModels -> new LocationRowDataModel[rowDataModels]));
//            locationDataModel.postValue(dataModel);

            // Implementation 5
            List<GetCityListCitiesResponse> responses = Arrays.asList(response.getCities());
            LocationDataModel dataModel = new LocationDataModel(responses.stream().map(LocationViewModel::apply).toArray(LocationRowDataModel[]::new));
            locationDataModel.postValue(dataModel);
        }
    }

    // Implementation 5
    @NonNull
    private static LocationRowDataModel apply(@NonNull GetCityListCitiesResponse response) {
        return new LocationRowDataModel(response.getName());
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
//                getViewModel().getGetCityListResponse().observe(getViewLifecycleOwner(), new Observer<GetCityListResponse>() {
//                    @Override
//                    public void onChanged(GetCityListResponse response) {}
//                });
//            }
//        });

        // Implementation 6-2
        getBinding().imageView.setOnClickListener(v -> {
            getViewModel().getGetCityListResponse().observe(getViewLifecycleOwner(), response -> {});
        });
    }
}
```

- `WeatherViewModel`

```
public class WeatherViewModel extends ViewModel {
    public void fetchCityList(Context context) {
        NetworkManager manager = new NetworkManager();
        
        // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用

        // Implementation 1
//        manager.getCityList(context, new RequestHandler<GetCityListResponse>() {
//            @Override
//            public void completion(@Nullable GetCityListResponse response) {
//                if (response != null) {
//                    getCityListResponse.setValue(response);
//                    getCityListResponse.postValue(response);
//                }
//            }
//        });
        
        // Implementation 2
//        manager.getCityList(context, response -> {
//            getCityListResponse.setValue(response);
//            getCityListResponse.postValue(response);
//        });
        
        // Implementation 3
        manager.getCityList(context, getCityListResponse::setValue);
        manager.getCityList(context, getCityListResponse::postValue);
    }
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
