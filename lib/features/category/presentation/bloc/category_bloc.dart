import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/category_model.dart';
import '../../data/repositoty/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  int page = 0;
  final int limit = 3;
  bool hasReachedMax = false;

  List<Results> _allResults = []; // all fetched data
  List<Results> _visibleResults = []; // what to show in UI

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitState()) {
    on<CategoryPressedEvent>(_onCategoryPressedEvent);
    on<CategoryLoadMoreEvent>(_onCategoryLoadMoreEvent);
    on<CategoryListingResetEvent>(_onCategoryListingResetEvent);
  }

  Future<void> _onCategoryPressedEvent(
    CategoryPressedEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoadingState());
    try {
      final res = await _categoryRepository.call(
        event.categoryName,
        'ZPl38FNUf5I1ycvkjll6VnnQ2ZhQQzWA',
      );

      if (res.status?.toLowerCase() == "ok" && res.results != null) {
        _allResults = res.results!;
        page = 0;
        hasReachedMax = false;

        _visibleResults = _allResults.take(limit).toList();
        if (_visibleResults.length >= _allResults.length) {
          hasReachedMax = true;
        }

        final updatedModel = res.copyWith(results: _visibleResults);
        emit(CategorySuccessState(categoryModel: updatedModel));
      } else {
        emit(CategoryErrorState(errorMessage: "Failed to load data"));
      }
    } catch (e) {
      log("Category Error ${e.toString()}");
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _onCategoryLoadMoreEvent(
    CategoryLoadMoreEvent event,
    Emitter<CategoryState> emit,
  ) async {
    if (hasReachedMax) return;
    final currentState = state;
    if (currentState is CategorySuccessState) {
      emit(CategorySuccessState(
        categoryModel: currentState.categoryModel,
        isLoadingMore: true,
      ));

      // Load next chunk
      page++;
      final startIndex = page * limit;
      final endIndex = startIndex + limit;

      final nextChunk = _allResults.sublist(
        startIndex,
        endIndex > _allResults.length ? _allResults.length : endIndex,
      );

      _visibleResults.addAll(nextChunk);

      if (_visibleResults.length >= _allResults.length) {
        hasReachedMax = true;
      }

      final updatedModel = currentState.categoryModel.copyWith(
        results: _visibleResults,
      );

      emit(CategorySuccessState(
        categoryModel: updatedModel,
        isLoadingMore: false,
      ));
    }
  }

  void _onCategoryListingResetEvent(
    CategoryListingResetEvent event,
    Emitter<CategoryState> emit,
  ) {
    page = 0;
    hasReachedMax = false;
    _allResults = [];
    _visibleResults = [];
    emit(CategoryInitState());
  }
}
