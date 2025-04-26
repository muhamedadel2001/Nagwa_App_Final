
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nagwa_app/features/get_books/data/models/book_model.dart';

import '../../../../../core/databases/cache/my_cache.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/widgets/snack_bars.dart';

class BookLocalDataSource {

  cacheBooks(BookModel bookModel) {
    if (bookModel.results != null) {
      MyCache.saveData(
          key: 'books', value: jsonEncode(bookModel.toJson()));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }

  Future<BookModel> getLastBooks(BuildContext context) {
    final jsonString = MyCache.getDataString(key: 'books');
    if (jsonString != null) {
      SnackBars.errorSnack(context: context, msg: 'No Internet Connection !');
      return Future.value(BookModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection !');
    }
  }
}

