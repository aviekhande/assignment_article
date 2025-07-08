import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../core/config/app_config.dart';
import '../model/category_model.dart';

part 'category_api.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String baseUrl}) = _CategoryApi;

@GET("/{name}.json")
  Future<CategoryModel> getCategory(
    @Path("name") String categoryName,
     @Query("api-key") String apiKey,
  );

}
