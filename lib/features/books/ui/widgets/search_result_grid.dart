import 'package:flutter/material.dart';
import 'package:open_library_app/features/books/books.dart';

class SearchResultGrid extends StatelessWidget {
  final List<SearchResultViewModel> searchResult;
  final void Function(SearchResultViewModel book) onDetailsPressed;

  const SearchResultGrid({
    super.key,
    required this.searchResult,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SearchGridItem(
          item: searchResult[index],
          onDetailsPressed: onDetailsPressed,
        ),
        childCount: searchResult.length,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
    );
  }
}
