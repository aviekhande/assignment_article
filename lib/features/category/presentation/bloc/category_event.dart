part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

final class CategoryPressedEvent extends CategoryEvent {
  final String categoryName;

  const CategoryPressedEvent({
    required this.categoryName,
  });
  @override
  List<Object> get props => [categoryName];
}
final class CategoryLoadMoreEvent extends CategoryEvent {

  const CategoryLoadMoreEvent();
  @override
  List<Object> get props => [];
}

class CategoryListingResetEvent extends CategoryEvent {

  const CategoryListingResetEvent();

  @override
  List<Object> get props => [];
}