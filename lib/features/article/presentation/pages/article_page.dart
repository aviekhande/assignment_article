import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/textstyles.dart';
import '../../../category/presentation/bloc/category_bloc.dart';

@RoutePage()
class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.index});
  final int index;

  // Static variables to be set before navigation
  static String title = '1';
  static String content = '12';
  static String imageUrl =
      'https://static01.nyt.com/images/2025/07/07/multimedia/07dc-prexy-lkjw/07dc-prexy-lkjw-superJumbo.jpg';
  static String author = '21';
  static String publishedDate = '21';
  static String url =
      'https://static01.nyt.com/images/2025/07/07/multimedia/07dc-prexy-lkjw/07dc-prexy-lkjw-superJumbo.jpg';
  static List<String> tags = ["fdedf"];

  void _launchArticleLink(BuildContext context, String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open article link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kColorPrimary,
        title: Text(
          'Article',
          style: kTextStyleDMSans600.copyWith(color: AppColors.kColorWhite),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.kColorWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            state as CategorySuccessState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.categoryModel.results![index].title ?? '',
                  style: kTextStyleDMSans700.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),

                if (state.categoryModel.results![index].publishedDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Published on: ${state.categoryModel.results![index].publishedDate ?? ''}',
                      style: kTextStyleDMSans400.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      (state.categoryModel.results![index].multimedia != null &&
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
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 200,
                              child: Center(
                                child: Icon(Icons.broken_image, size: 48),
                              ),
                            );
                          },
                        )
                      : const SizedBox(
                          height: 200,
                          child: Center(
                            child: Icon(Icons.image_not_supported, size: 48),
                          ),
                        ),
                ),

                const SizedBox(height: 24),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => _launchArticleLink(
                      context,
                      state.categoryModel.results![index].url ?? "",
                    ),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Read Full Article'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
