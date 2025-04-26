import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_app/features/get_books/data/models/book_model.dart';
import 'package:nagwa_app/features/get_books/presentation/manager/book_cubit.dart';

class BookCardItem extends StatelessWidget {
  final Results results;
  final int index;

  const BookCardItem({super.key, required this.results, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = BookCubit.get(context);
        final isExpanded = cubit.isExpanded(index);
        return Card(
          color: Colors.white,
          elevation: 6,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: results.formats?.imageJpeg ?? '',
                        width: 80.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          color: Colors.grey[200],
                          width: 80.w,
                          height: 120.h,
                        ),
                        errorWidget: (_, __, ___) => const Icon(Icons.book),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            results.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            results.authors
                                ?.map((author) =>
                            author.name ?? 'Unknown Author')
                                .join(', ') ??
                                'No Authors',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey[600]),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (results.summaries != null && results.summaries!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Summary', style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 4),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 200),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: Text(
                          results.summaries!.first,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        secondChild: Text(results.summaries!.first),
                      ),
                      InkWell(
                        onTap: () => cubit.toggleExpanded(index),
                        child: Text(
                          isExpanded ? 'See Less' : 'See More',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );

  }
}
