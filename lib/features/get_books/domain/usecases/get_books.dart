import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:nagwa_app/features/get_books/domain/repositories/book_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/book_model.dart';

class GetBooksUseCase {
  final BookRepo bookRepo;

  GetBooksUseCase(this.bookRepo);

  Future<Either<Failure, BookModel>> getBooks(
      {int page = 1, String? query,required BuildContext context}) {
    return bookRepo.getBooks(page: page, query: query, context: context);
  }
}
