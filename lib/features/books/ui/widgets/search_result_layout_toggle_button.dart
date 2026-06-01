import 'package:flutter/material.dart';
import 'package:open_library_app/features/books/ui/enums/search_result_layout.dart';

class SearchResultLayoutToggleButton extends StatelessWidget {
  const SearchResultLayoutToggleButton({
    super.key,
    required this.layout,
    required this.onChanged,
  });

  final SearchResultLayout layout;
  final ValueChanged<SearchResultLayout> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: SegmentedButton<SearchResultLayout>(
          segments: SearchResultLayout.values.map((layout) {
            return ButtonSegment<SearchResultLayout>(
              value: layout,
              label: Text(layout.label),
              icon: Icon(layout.icon),
            );
          }).toList(),
          selected: {layout},
          onSelectionChanged: (newSelection) {
            onChanged(newSelection.first);
          },
        ),
      ),
    );
  }
}
