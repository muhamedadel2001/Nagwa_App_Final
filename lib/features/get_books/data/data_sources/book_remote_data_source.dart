import 'package:nagwa_app/core/utilise/constants/end_points.dart';
import '../../../../core/databases/api/api_consumer.dart';
import '../models/book_model.dart';

class BookRemoteDataSource {
  final ApiConsumer apiConsumer;

  BookRemoteDataSource({required this.apiConsumer});

  Future<BookModel>fetchBooks({int page = 1, String? query}) async {
    try {
      final response = await apiConsumer.get(
        baseUrl,
        queryParameters: {
          'page': page,
          if (query != null && query.isNotEmpty) 'search': query,
        },
      );
      return BookModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch books: $e');
    }
  }
}
