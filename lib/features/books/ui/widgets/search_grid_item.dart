import 'package:flutter/material.dart';
import 'package:open_library_app/features/books/books.dart';

class SearchGridItem extends StatelessWidget {
  final SearchResultViewModel item;
  final void Function(SearchResultViewModel book) onDetailsPressed;

  const SearchGridItem({
    super.key,
    required this.item,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onDetailsPressed(item),
      child: Padding(
        padding: EdgeInsetsGeometry.only(top: 15),
        child: Column(
          children: [
            Image.network(
              item.thumbnailUrl,
              width: 100,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 150,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.menu_book),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                item.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
