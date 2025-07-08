import 'package:flutter/widgets.dart';
import '../model/category_model.dart';
import '../service/category_service.dart';

class CategoryRepository {
  final CategoryService _service;

  CategoryRepository({required CategoryService categoryService})
    : _service = categoryService;

  Future<CategoryModel> call(String categoryName, String apiKey) async {
    try {
      debugPrint("CategoryRepository: calling service...");
      return await _service.categoryUser( categoryName, apiKey);
    } catch (e) {
      rethrow;
    }
  }
}
