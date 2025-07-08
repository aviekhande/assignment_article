part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitState extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategorySuccessState extends CategoryState {
  final CategoryModel categoryModel;

  const CategorySuccessState({required this.categoryModel});

  @override
  List<Object> get props => [categoryModel];
}

final class CategoryErrorState extends CategoryState {
  final String errorMessage;

  const CategoryErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
