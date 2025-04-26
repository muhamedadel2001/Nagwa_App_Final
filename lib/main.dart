import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_app/core/databases/cache/my_cache.dart';
import 'package:nagwa_app/features/get_books/data/data_sources/book_local_data_source.dart';

import 'core/connection/network_info.dart';
import 'core/databases/api/dio_consumer.dart';
import 'core/utilise/helper/functions/dependency_start.dart';
import 'core/utilise/helper/observer/bloc_observer.dart';
import 'features/get_books/data/data_sources/book_remote_data_source.dart';
import 'features/get_books/data/repositories/book_repo_impl.dart';
import 'features/get_books/domain/usecases/get_books.dart';
import 'features/get_books/presentation/manager/book_cubit.dart';
import 'features/get_books/presentation/screens/book_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHomeStart();
  Bloc.observer = MyBlocObserver();

  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    MyCache.initCache(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 500),
      builder:
          (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: BlocProvider(
              create: (context) => sl<BookCubit>(),
              child: const BookListPage(),
            ),
          ),
    );
  }
}
