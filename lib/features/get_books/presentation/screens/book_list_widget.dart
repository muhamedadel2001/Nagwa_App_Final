import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_app/features/get_books/presentation/screens/book_card_item.dart';
import '../manager/book_cubit.dart';

class BookListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const BookListWidget({super.key, required this.scrollController});

  Future<bool> _hasConnection() async {
    return await DataConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final cubit = BookCubit.get(context);
        if (state is BookLoading && cubit.books.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookError) {
          return Center(child: Text(state.message));
        } else if (state is BookLoaded || state is BookExpandedState) {
          if (cubit.books.isEmpty) {
            return const Center(child: Text('No books found.'));
          }

          return FutureBuilder<bool>(
            future: _hasConnection(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {}

              final hasConnection = snapshot.data ?? false;

              return ListView.builder(
                controller: scrollController,
                itemCount:
                    hasConnection
                        ? cubit.books.length + (cubit.hasMore ? 1 : 0)
                        : cubit.books.length,
                itemBuilder: (context, index) {
                  if (index < cubit.books.length) {
                    return BookCardItem(
                      results: cubit.books[index],
                      index: index,
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
