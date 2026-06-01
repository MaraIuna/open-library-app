import 'package:open_library_app/features/books/data/models/work_dto.dart';
import 'package:open_library_app/features/books/domain/models/search_book.dart';

class SearchResultViewModel {
  final String olid;
  final String title;
  final String author;
  final String thumbnailUrl;

  const SearchResultViewModel({
    required this.olid,
    required this.title,
    required this.author,
    required this.thumbnailUrl,
  });

  factory SearchResultViewModel.fromWorkDto(WorkDto work) {
    return SearchResultViewModel(
      olid: work.key.split("/")[2], // pattern: /works/ID -> ID on index 2
      title: work.title,
      author: work.author_name.join(', '),
      thumbnailUrl: work.cover_i != null
          ? 'https://covers.openlibrary.org/b/id/${work.cover_i}-S.jpg'
          : "",
    );
  }

  factory SearchResultViewModel.fromSearchBookDto(SearchBook book) {
    return SearchResultViewModel(
      olid: book.olid,
      title: book.title,
      author: book.authors.join(', '),
      thumbnailUrl: book.hasCover ? book.thumbnailUrl! : "",
    );
  }
}
