import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_app/core/utilise/constants/app_colors.dart';
import 'package:nagwa_app/features/get_books/presentation/screens/search_widget.dart';
import '../../../../core/utilise/helper/functions/book_list_logic.dart';
import 'book_list_widget.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late BookListLogic _bookListLogic;

  @override
  void initState() {
    super.initState();
    _bookListLogic = BookListLogic(
      context: context,
      searchController: _searchController,
      scrollController: _scrollController,
    );
    _bookListLogic.init();
  }

  @override
  void dispose() {
    _bookListLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackBG,
          title: const Text('Books',style: TextStyle(
            color: AppColors.white
          ),),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            children: [
              SearchWidget(
                searchController: _searchController,
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: BookListWidget(
                  scrollController: _scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
