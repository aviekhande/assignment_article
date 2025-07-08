import 'package:dio/dio.dart';

import '../../../../core/services/api_client/service/base_service.dart';
import '../api/category_api.dart';
import '../model/category_model.dart';

class CategoryService extends BaseService {
  final CategoryApi _api;

  CategoryService({required CategoryApi api, required Dio dio})
    : _api = api,
      super(dio);

  Future<CategoryModel> categoryUser(String categoryName,String apiKey) {
    return safeRequest(() {
      return _api.getCategory( categoryName, apiKey);
    }, fromJson: CategoryModel.fromJson);
  }
}
