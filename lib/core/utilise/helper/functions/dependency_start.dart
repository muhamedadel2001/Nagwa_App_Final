
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:nagwa_app/features/get_books/data/data_sources/book_local_data_source.dart';
import 'package:nagwa_app/features/get_books/data/data_sources/book_remote_data_source.dart';
import 'package:nagwa_app/features/get_books/data/repositories/book_repo_impl.dart';
import 'package:nagwa_app/features/get_books/domain/repositories/book_repo.dart';
import 'package:nagwa_app/features/get_books/domain/usecases/get_books.dart';
import 'package:nagwa_app/features/get_books/presentation/manager/book_cubit.dart';
import '../../../connection/network_info.dart';
import '../../../databases/api/api_consumer.dart';
import '../../../databases/api/dio_consumer.dart';
final sl = GetIt.instance;
void initHomeStart() {
  sl.registerLazySingleton(() {
    return Dio(BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30)));
  });
  sl.registerLazySingleton<ApiConsumer>(() {
    return DioConsumer(dio: sl());
  });
  sl.registerLazySingleton<NetworkInfo>(() {
    return NetworkInfoImpl(DataConnectionChecker());
  });
  sl.registerLazySingleton<BookRemoteDataSource>(() {
    return BookRemoteDataSource(apiConsumer: sl());
  });
  sl.registerLazySingleton<BookLocalDataSource>(() {
    return BookLocalDataSource ();
  });

  sl.registerLazySingleton<BookRepo>(() {
    return BookRepoImpl(bookRemoteDataSource: sl(), networkInfo: sl(),bookLocalDataSource: sl());
  });
  sl.registerLazySingleton(() {
    return GetBooksUseCase( sl());
  });

  sl.registerFactory(() {
    return BookCubit( sl());
  });

}

