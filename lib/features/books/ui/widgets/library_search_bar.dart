import 'package:flutter/material.dart';
import 'package:open_library_app/features/books/ui/enums/search_filter.dart';

typedef MenuEntry = DropdownMenuEntry<SearchFilter>;

class LibrarySearchBar extends StatefulWidget {
  final Future<void> Function(String query, SearchFilter filter) onSearch;

  const LibrarySearchBar({super.key, required this.onSearch});

  @override
  State<LibrarySearchBar> createState() => _LibrarySearchBarState();
}

class _LibrarySearchBarState extends State<LibrarySearchBar> {
  final controller = TextEditingController();

  static final List<MenuEntry> menuEntries = SearchFilter.values
      .map((filter) => MenuEntry(value: filter, label: filter.label))
      .toList();

  SearchFilter dropdownValue = SearchFilter.all;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16.0),
      ),
      leading: DropdownMenu<SearchFilter>(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
        dropdownMenuEntries: menuEntries,
        initialSelection: SearchFilter.all,
        onSelected: (SearchFilter? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
      onSubmitted: (value) => widget.onSearch(value, dropdownValue),
      trailing: [
        FilledButton(
          onPressed: () => widget.onSearch(controller.text, dropdownValue),
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
