import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_library_app/core/constants/ui_constants.dart';
import 'package:open_library_app/features/books/ui/enums/search_filter.dart';
import 'package:open_library_app/shared/widgets/library_app_bar.dart';
import 'package:open_library_app/features/books/ui/widgets/books_widgets.dart';

void main() {
  group('LibraryAppBar', () {
    late String? receivedQuery;
    late SearchFilter? receivedFilter;

    Future<void> onSearch(String query, SearchFilter filter) async {
      receivedQuery = query;
      receivedFilter = filter;
    }

    Widget createWidget() {
      return MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              LibraryAppBar(onSearch: onSearch),
              const SliverToBoxAdapter(child: SizedBox(height: 500)),
            ],
          ),
        ),
      );
    }

    setUp(() {
      receivedQuery = null;
      receivedFilter = null;
    });

    testWidgets('renders app title', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.text('OpenLibraryApp'), findsOneWidget);
    });

    testWidgets('renders LibrarySearchBar', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(LibrarySearchBar), findsOneWidget);
    });

    testWidgets('uses expected SliverAppBar configuration', (tester) async {
      await tester.pumpWidget(createWidget());

      final appBar = tester.widget<SliverAppBar>(find.byType(SliverAppBar));

      expect(appBar.pinned, isTrue);
      expect(appBar.expandedHeight, UiConstants.appBarHeightExpanded);
      expect(appBar.collapsedHeight, UiConstants.appBarHeightCollapsed);
    });

    testWidgets('passes onSearch callback to LibrarySearchBar', (tester) async {
      await tester.pumpWidget(createWidget());

      final searchBar = tester.widget<LibrarySearchBar>(
        find.byType(LibrarySearchBar),
      );

      await searchBar.onSearch('testQuery', SearchFilter.title);

      expect(receivedQuery, 'testQuery');
      expect(receivedFilter, SearchFilter.title);
    });
  });
}
