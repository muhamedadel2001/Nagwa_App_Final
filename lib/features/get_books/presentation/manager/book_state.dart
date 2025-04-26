part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Results> books;
  final bool hasMore;
  final int currentPage;
  final String? query;
  BookLoaded({
    required this.books,
    required this.hasMore,
    required this.currentPage,
    this.query,
  });
}
class BookError extends BookState {
  final String message;
  BookError(this.message);
}
class BookExpandedState extends BookState {
  final Map<int, bool> expandedMap;
  BookExpandedState(this.expandedMap);
}
