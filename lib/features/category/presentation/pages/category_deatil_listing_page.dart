import 'package:assignmen_article/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/textstyles.dart';
import '../bloc/category_bloc.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockArticles = [
      {
        'title': "How Insularity Defined the Last Stages of Biden’s Career",
        'abstract':
            "The effort by Joseph R. Biden Jr.’s inner circle to limit access to him helps explain why it took him more than three weeks to drop his re-election bid after his disastrous debate performance.",
        'image':
            "https://static01.nyt.com/images/2025/07/08/multimedia/08dc-Biden-mcqw/08dc-Biden-mcqw-superJumbo.jpg",
        'author': 'By Tyler Pager',
      },
      {
        'title':
            "Netanyahu Releases Letter Nominating Trump for Nobel Peace Prize",
        'abstract':
            "Prime Minister Benjamin Netanyahu of Israel praised President Trump’s role in his country’s establishment of diplomatic relations with some Arab states.",
        'image':
            "https://static01.nyt.com/images/2025/07/07/multimedia/07dc-prexy-lkjw/07dc-prexy-lkjw-superJumbo.jpg",
        'author': 'By Matthew Mpoke Bigg',
      },
    ];

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
                ? ListView.builder(
                    itemCount: mockArticles.length,
                    itemBuilder: (context, index) {
                      final article = mockArticles[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(ArticleRoute(index:index));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (state.categoryModel.results![index].multimedia !=
                                          null &&
                                      state
                                          .categoryModel
                                          .results![index]
                                          .multimedia!
                                          .isNotEmpty &&
                                      state
                                              .categoryModel
                                              .results![index]
                                              .multimedia!
                                              .first
                                              .url !=
                                          null)
                                  ? Image.network(
                                      state
                                          .categoryModel
                                          .results![index]
                                          .multimedia!
                                          .first
                                          .url!,
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
                                  state.categoryModel.results![index].title!,
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
                                  state.categoryModel.results![index].abstract!,
                                  style: kTextStyleDMSans400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("NO DATA FOUND", style: kTextStyleDMSans400),
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
