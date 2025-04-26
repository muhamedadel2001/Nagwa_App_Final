import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nagwa_app/features/get_books/data/models/book_model.dart';
import 'package:nagwa_app/features/get_books/domain/usecases/get_books.dart';
part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit(this.getBooksUseCase) : super(BookInitial());
  static BookCubit get(context) => BlocProvider.of<BookCubit>(context);
  final GetBooksUseCase getBooksUseCase;
  List<Results> books = [];
  int currentPage = 1;
  bool hasMore = true;
  String? currentQuery;
  bool isFirstLoad = true;
  bool _isFetching = false;

  void fetchBooks({bool isRefresh = false, String? query,required BuildContext context}) async {
    if (isFirstLoad) {
      emit(BookLoading());
      isFirstLoad = false;
    }
    if (_isFetching) return;
    _isFetching = true;
    if (query != currentQuery) {
      books.clear();
      currentPage = 1;
      hasMore = true;
      currentQuery = query;
      emit(BookLoading());
    } else if (isRefresh) {
      if (isRefresh == false) {
        currentPage = 1;
      }
      hasMore = true;
    } else if (!hasMore) {
      _isFetching = false;
      return;
    }
    final result = await getBooksUseCase.getBooks(context: context,
      query: currentQuery,
      page: currentPage,
    );
    result.fold(
      (failure) {
        _isFetching = false;
        emit(BookError(failure.errMessage));
      },
      (success) {
        final newBooks = success.results ?? [];
        books.addAll(newBooks);
        hasMore = success.next != null;
        currentPage++;
        _isFetching = false;
        emit(BookLoaded(
          currentPage: currentPage,
          books: List.from(books),
          hasMore: hasMore,
          query: currentQuery,
        ));
      },
    );
  }
  Map<int, bool> expandedMap = {};

  void toggleExpanded(int index) {
    final current = expandedMap[index] ?? false;
    expandedMap[index] = !current;
    emit(BookExpandedState(Map.from(expandedMap)));
  }

  bool isExpanded(int index) {
    return expandedMap[index] ?? false;
  }
}
