import 'package:flutter/material.dart';
import 'package:open_library_app/core/enums/displayed_view.dart';
import 'package:open_library_app/core/widgets/body_content.dart';
import 'package:open_library_app/features/books/books.dart';
import 'package:open_library_app/features/books/domain/models/search_book.dart';
import 'package:open_library_app/features/books/ui/enums/search_filter.dart';
import 'package:open_library_app/shared/widgets/library_app_bar.dart';

void main() {
  runApp(OpenLibraryApp());
}

class OpenLibraryApp extends StatefulWidget {
  final BookRepositoryRemote _repo = BookRepositoryRemote();

  OpenLibraryApp({super.key});

  @override
  State<OpenLibraryApp> createState() => _OpenLibraryAppState();
}

class _OpenLibraryAppState extends State<OpenLibraryApp> {
  List<SearchResultViewModel> searchResult = [];

  DisplayedView currentBodyState = DisplayedView.empty;

  Future<void> search(String query, SearchFilter filter) async {
    setState(() {
      currentBodyState = DisplayedView.loading;
    });

    SearchResultDto generalSearchResult;

    switch (filter) {
      case SearchFilter.all:
        generalSearchResult = await widget._repo.generalSearch(query);
        break;
      case SearchFilter.author:
        generalSearchResult = await widget._repo.searchWorksByAuthor(query);
        break;
      case SearchFilter.title:
        generalSearchResult = await widget._repo.searchWorksByTitle(query);
        break;
    }

    final searchBooks = generalSearchResult.docs.map(
      (work) => SearchBook.fromDto(work),
    );

    setState(() {
      if (searchBooks.isNotEmpty) {
        searchResult = searchBooks
            .map((book) => SearchResultViewModel.fromSearchBookDto(book))
            .toList();
        currentBodyState = DisplayedView.list;
      } else {
        currentBodyState = DisplayedView.emptySearch;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Library App',

      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            LibraryAppBar(onSearch: search),
            BodyContent(
              displayedView: currentBodyState,
              searchResult: searchResult,
            ),
          ],
        ),
      ),
    );
  }
}
