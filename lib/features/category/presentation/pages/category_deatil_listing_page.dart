import 'dart:developer';

import 'package:assignmen_article/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/textstyles.dart';
import '../bloc/category_bloc.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kColorPrimary,
        title: Text(
          category,
          style: kTextStyleDMSans600.copyWith(color: AppColors.kColorWhite),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.kColorWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccessState) {
            return state.categoryModel.results!.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      context.read<CategoryBloc>().add(
                        CategoryListingResetEvent(),
                      );
                      context.read<CategoryBloc>().add(
                        CategoryPressedEvent(categoryName: category),
                      );
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (!state.isLoadingMore &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          context.read<CategoryBloc>().add(
                            CategoryLoadMoreEvent(),
                          );
                        }
                        return false;
                      },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount:
                            state.categoryModel.results!.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.categoryModel.results!.length &&
                              state.isLoadingMore) {
                            log("LOADER DISPLAYYYAYAYAY");
                            return SizedBox(
                              height: 50.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final article = state.categoryModel.results![index];
                          return GestureDetector(
                            onTap: () =>
                                context.router.push(ArticleRoute(index: index)),
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (article.multimedia != null &&
                                          article.multimedia!.isNotEmpty &&
                                          article.multimedia!.first.url != null)
                                      ? Image.network(
                                          article.multimedia!.first.url!,
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const SizedBox(
                                                  height: 200,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.broken_image,
                                                      size: 48,
                                                    ),
                                                  ),
                                                );
                                              },
                                        )
                                      : const SizedBox(
                                          height: 200,
                                          child: Center(
                                            child: Icon(
                                              Icons.image_not_supported,
                                              size: 48,
                                            ),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      article.title ?? '',
                                      style: kTextStyleDMSans700.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      article.abstract ?? '',
                                      style: kTextStyleDMSans400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Text("NO DATA FOUND", style: kTextStyleDMSans400),
                  );
          } else if (state is CategoryLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.kColorPrimary,
                backgroundColor: AppColors.kColorWhite,
              ),
            );
          }
          return Center(
            child: Text("Some Thing Went Wrong", style: kTextStyleDMSans400),
          );
        },
      ),
    );
  }
}
