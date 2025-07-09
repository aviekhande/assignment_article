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
  final bool isLoadingMore;

  const CategorySuccessState({required this.categoryModel,this.isLoadingMore=false});

  @override
  List<Object> get props => [categoryModel,isLoadingMore];
}

final class CategoryErrorState extends CategoryState {
  final String errorMessage;

  const CategoryErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
