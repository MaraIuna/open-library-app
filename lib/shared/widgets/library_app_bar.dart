import 'package:flutter/material.dart';
import 'package:open_library_app/core/constants/ui_constants.dart';
import 'package:open_library_app/features/books/ui/widgets/books_widgets.dart';
import 'package:open_library_app/features/books/ui/enums/search_filter.dart';

class LibraryAppBar extends StatelessWidget {
  const LibraryAppBar({super.key, required this.onSearch});

  final Future<void> Function(String query, SearchFilter filter) onSearch;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: UiConstants.appBarHeightCollapsed,
      expandedHeight: UiConstants.appBarHeightExpanded,
      collapsedHeight: UiConstants.appBarHeightCollapsed,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2016/11/29/12/50/bookcases-1869616_1280.jpg',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withValues(alpha: .45)),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'OpenLibraryApp',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LibrarySearchBar(onSearch: onSearch),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
