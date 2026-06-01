import 'package:flutter/material.dart';
import 'package:open_library_app/core/constants/ui_constants.dart';
import 'package:open_library_app/features/books/ui/viewmodels/search_result_viewmodel.dart';

class SearchListItem extends StatelessWidget {
  final SearchResultViewModel item;
  final void Function(SearchResultViewModel book) onDetailsPressed;

  const SearchListItem({
    super.key,
    required this.item,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Row(
            spacing: UiConstants.spacingMedium,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      item.thumbnailUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.menu_book),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  item.author,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: FilledButton(
                    onPressed: () => onDetailsPressed(item),
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      fixedSize: const Size(50, 50),
                      padding: EdgeInsets.zero,
                    ),
                    child: const SizedBox.square(
                      dimension: 20,
                      child: Center(child: Icon(Icons.book, size: 20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
