import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:nagwa_app/features/get_books/data/models/book_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class BookRepo {
  Future<Either<Failure, BookModel>> getBooks(
      {int page = 1, String? query,required BuildContext context});
}
