import 'package:assignmen_article/core/common/widgets/loader_widget.dart';
import 'package:assignmen_article/core/routes/app_router.dart';
import 'package:assignmen_article/core/theme/app_colors.dart';
import 'package:assignmen_article/core/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/textstyles.dart';
import '../../../category/presentation/bloc/category_bloc.dart';

@RoutePage()
// ---------------- Home Screen ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'home', 'icon': AppIcons.homeIc},
    {'title': 'world', 'icon': AppIcons.worldIc},
    {'title': 'national', 'icon': AppIcons.nationalIc},
    {'title': 'politics', 'icon': AppIcons.politicsIc},
    {'title': 'upshot', 'icon': AppIcons.upshotIc},
    {'title': 'nyregion', 'icon': AppIcons.nyregionIc},
    {'title': 'business', 'icon': AppIcons.businessIc},
    {'title': 'technology', 'icon': AppIcons.technologyIc},
    {'title': 'science', 'icon': AppIcons.scienceIc},
    {'title': 'health', 'icon': AppIcons.healthIc},
    {'title': 'sports', 'icon': AppIcons.sportsIc},
    {'title': 'arts', 'icon': AppIcons.artsIc},
    {'title': 'books', 'icon': AppIcons.booksIc},
    {'title': 'movies', 'icon': AppIcons.moviesIc},
    {'title': 'theater', 'icon': AppIcons.theaterIc},
    {'title': 'fashion', 'icon': AppIcons.fashionIc},
    {'title': 'food', 'icon': AppIcons.foodIc},
    {'title': 'travel', 'icon': AppIcons.travelIc},
    {'title': 'magazine', 'icon': AppIcons.magazineIc},
    {'title': 'realestate', 'icon': AppIcons.realestateIc},
    {'title': 'obituaries', 'icon': AppIcons.obituariesIc},
    {'title': 'insider', 'icon': AppIcons.insiderIc},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kColorPrimary,
        title: Text(
          'News Categories',
          style: kTextStyleDMSans600.copyWith(color: AppColors.kColorWhite),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    context.read<CategoryBloc>().add(
                      CategoryPressedEvent(categoryName: category['title']),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(category['icon'], color: Colors.blue),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              category['title'].toString().toUpperCase(),
                              style: kTextStyleDMSans500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            AppIcons.chevronRightIc,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocConsumer<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return LoaderWidget();
              }
              return Container();
            },
            listener: (context, state) {
              if (state is CategoryErrorState) {
                Utils.showSnackBar(
                  context,
                  state.errorMessage,
                  isSuccess: false,
                );
              } else if (state is CategorySuccessState) {
                context.router.push(
                  CategoryRoute(category: state.categoryModel.section!),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
