import 'package:open_library_app/features/books/books.dart';

abstract class BookRepository {
  Future<SearchResultDto> generalSearch(String query);

  Future<SearchResultDto> searchWorksByTitle(String query);

  Future<SearchResultDto> searchWorksByAuthor(String query);

  Future<BookDto> bookByOLId(String bookOLId);
}
