part of '../init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {



  serviceLocator.registerLazySingleton(() => Dio());


  serviceLocator.registerLazySingleton(()=>AppRouter());

  //INIT Category
  _initCategory();
}

void _initCategory() {
  serviceLocator.registerFactory<CategoryApi>(
    () => CategoryApi(serviceLocator(), baseUrl: AppConfig.baseUrl),
  );

  serviceLocator.registerFactory<CategoryService>(
    () => CategoryService(api: serviceLocator(), dio: serviceLocator()),
  );

  serviceLocator.registerFactory<CategoryRepository>(
    () => CategoryRepository(categoryService: serviceLocator()),
  );

  serviceLocator.registerSingleton(
    CategoryBloc(categoryRepository: serviceLocator()),

  );
}
