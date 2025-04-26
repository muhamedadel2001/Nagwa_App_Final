import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_app/core/utilise/constants/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;

  const SearchWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search books...',
        prefixIcon: Icon(Icons.search_rounded, color: AppColors.backGround),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchController.clear();
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.r),
        ),
      ),
    );
  }
}
