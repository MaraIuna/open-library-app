import 'package:flutter/material.dart';
import 'package:open_library_app/core/enums/displayed_view.dart';
import 'package:open_library_app/features/books/data/repositories/book_repository_remote.dart';
import 'package:open_library_app/features/books/ui/enums/search_result_layout.dart';
import 'package:open_library_app/features/books/ui/viewmodels/search_result_viewmodel.dart';
import 'package:open_library_app/features/books/ui/widgets/book_details.dart';
import 'package:open_library_app/features/books/ui/widgets/search_result_grid.dart';
import 'package:open_library_app/features/books/ui/widgets/search_result_layout_toggle_button.dart';
import 'package:open_library_app/features/books/ui/widgets/search_result_list.dart';
import 'package:open_library_app/shared/widgets/loading_indicator.dart';

// ignore: must_be_immutable
class BodyContent extends StatefulWidget {
  DisplayedView displayedView;
  final List<SearchResultViewModel>? searchResult;

  BodyContent({
    super.key,
    required this.displayedView,
    required this.searchResult,
  });

  @override
  State<StatefulWidget> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final BookRepositoryRemote _repo = BookRepositoryRemote();

  SearchResultViewModel? selectedBook;
  SearchResultLayout _activeLayout = SearchResultLayout.list;

  DisplayedView currentBodyState = DisplayedView.empty;

  void showDetails(SearchResultViewModel book) {
    setState(() {
      selectedBook = book;
      widget.displayedView = DisplayedView.details;
    });
  }

  void showSearchResult() {
    setState(() {
      selectedBook = null;
      switch (_activeLayout) {
        case SearchResultLayout.grid:
          widget.displayedView = DisplayedView.grid;
          break;
        case SearchResultLayout.list:
          widget.displayedView = DisplayedView.list;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.displayedView) {
      case DisplayedView.details:
        return SliverToBoxAdapter(
          child: BookDetails(
            book: selectedBook!,
            onBack: showSearchResult,
            repository: _repo,
          ),
        );

      case DisplayedView.loading:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: LoadingIndicator(),
        );
      case DisplayedView.error:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fehler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Bei der Abfrage an die OpenLibrary-Schnittstelle '
                  'ist ein unerwarteter Fehler aufgetreten.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      case DisplayedView.empty:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Willkommen',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Suche nach Büchern in der Open Library.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      case DisplayedView.emptySearch:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Keine Einträge gefunden',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      case DisplayedView.list:
        return SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: SearchResultLayoutToggleButton(
                layout: _activeLayout,
                onChanged: (newLayout) {
                  setState(() {
                    _activeLayout = newLayout;

                    switch (_activeLayout) {
                      case SearchResultLayout.grid:
                        widget.displayedView = DisplayedView.grid;
                        break;
                      case SearchResultLayout.list:
                        widget.displayedView = DisplayedView.list;
                        break;
                    }
                  });
                },
              ),
            ),
            SearchResultList(
              searchResult: widget.searchResult ?? [],
              onDetailsPressed: showDetails,
            ),
          ],
        );
      case DisplayedView.grid:
        return SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: SearchResultLayoutToggleButton(
                layout: _activeLayout,
                onChanged: (newLayout) {
                  setState(() {
                    _activeLayout = newLayout;

                    switch (_activeLayout) {
                      case SearchResultLayout.grid:
                        widget.displayedView = DisplayedView.grid;
                        break;
                      case SearchResultLayout.list:
                        widget.displayedView = DisplayedView.list;
                        break;
                    }
                  });
                },
              ),
            ),
            SearchResultGrid(
              searchResult: widget.searchResult ?? [],
              onDetailsPressed: showDetails,
            ),
          ],
        );
    }
  }
}
