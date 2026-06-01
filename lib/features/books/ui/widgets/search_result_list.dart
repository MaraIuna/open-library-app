import 'package:flutter/material.dart';
import 'package:open_library_app/features/books/books.dart';

class SearchResultList extends StatelessWidget {
  final List<SearchResultViewModel> searchResult;
  final void Function(SearchResultViewModel book) onDetailsPressed;

  const SearchResultList({
    super.key,
    required this.searchResult,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: searchResult.length,
      itemBuilder: (BuildContext context, int index) {
        final item = searchResult[index];
        return SearchListItem(item: item, onDetailsPressed: onDetailsPressed);
      },
    );
  }
}
