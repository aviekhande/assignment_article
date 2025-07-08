import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../init_dependencies.dart';
import '../../data/model/category_model.dart';
import '../../data/repositoty/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,

      super(CategoryInitState()) {
    on<CategoryPressedEvent>(_onCategoryPressedEvent);
  }

  _onCategoryPressedEvent(
    CategoryPressedEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoadingState());
    try {
      final res = await _categoryRepository.call(
        event.categoryName,
        'ZPl38FNUf5I1ycvkjll6VnnQ2ZhQQzWA',
      );
      if (res.status!.toLowerCase() == "ok") {
        return emit(CategorySuccessState(categoryModel: res));
      } else {
        emit(CategoryErrorState(errorMessage: "Failed"));
      }
    } catch (e) {
      log("Category Error ${e.toString()}");
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}
