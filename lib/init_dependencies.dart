import 'package:assignmen_article/core/routes/app_router.dart';
import 'package:assignmen_article/features/category/data/api/category_api.dart';
import 'package:assignmen_article/features/category/data/repositoty/category_repository.dart' show CategoryRepository;
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/config/app_config.dart';
import 'features/category/data/service/category_service.dart';
import 'features/category/presentation/bloc/category_bloc.dart';

part 'init_dependencies_main.dart';
