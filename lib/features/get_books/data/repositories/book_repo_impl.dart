import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:nagwa_app/features/get_books/data/data_sources/book_local_data_source.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/book_repo.dart';
import '../data_sources/book_remote_data_source.dart';
import '../models/book_model.dart';

class BookRepoImpl implements BookRepo {
  final NetworkInfo networkInfo;
  final BookRemoteDataSource bookRemoteDataSource;
  final BookLocalDataSource bookLocalDataSource;

  BookRepoImpl( {required this.networkInfo, required this.bookRemoteDataSource,required this.bookLocalDataSource});

  @override
  Future<Either<Failure, BookModel>> getBooks(
      {int page = 1, String? query, required BuildContext context}) async {
    try {
      if (await networkInfo.isConnected!){
        final remoteServices =
        await bookRemoteDataSource.fetchBooks(page: page, query: query);
        bookLocalDataSource.cacheBooks(remoteServices);
        return Right(remoteServices);
      }
      else{
        final localBooks = await bookLocalDataSource.getLastBooks(context);
        return Right(localBooks);
      }


    } catch (e) {
      print(e);
      return Left(Failure.handleError(e));
    }
  }
}
