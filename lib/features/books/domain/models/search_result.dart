import 'package:open_library_app/features/books/data/models/search_result_dto.dart';
import 'package:open_library_app/features/books/domain/models/search_book.dart';

class SearchResult {
  final int totalCount;
  final List<SearchBook> books;

  const SearchResult({required this.totalCount, required this.books});

  factory SearchResult.fromDto(SearchResultDto dto) {
    return SearchResult(
      totalCount: dto.num_found,
      books: dto.docs.map(SearchBook.fromDto).toList(),
    );
  }
}
