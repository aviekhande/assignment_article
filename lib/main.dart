import 'package:assignmen_article/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:assignmen_article/init_dependencies.dart';

import 'features/category/presentation/bloc/category_bloc.dart';

void main() async {
  await initDependencies();

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = serviceLocator<AppRouter>();

    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => serviceLocator<CategoryBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(primarySwatch: Colors.blue),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
