import 'package:open_library_app/core/constants/api_constants.dart';
import 'package:open_library_app/core/network/http_client.dart';
import 'package:open_library_app/features/books/data/models/book_dto.dart';
import 'package:open_library_app/features/books/data/models/search_result_dto.dart';
import 'package:open_library_app/features/books/data/repositories/book_repository.dart';

class BookRepositoryRemote implements BookRepository {
  final HttpClient _client = HttpClient();

  @override
  Future<BookDto> bookByOLId(String bookOLId) async {
    return BookDto.fromJson(
      await _client.getJson(
        Uri.parse('${ApiConstants.baseUrl}/works/$bookOLId.json'),
      ),
    );
  }

  @override
  Future<SearchResultDto> generalSearch(String query) async {
    return SearchResultDto.fromJson(
      await _client.getJson(
        Uri.parse('${ApiConstants.baseUrl}/search.json?q=$query'),
      ),
    );
  }

  @override
  Future<SearchResultDto> searchWorksByAuthor(String query) async {
    return SearchResultDto.fromJson(
      await _client.getJson(
        Uri.parse('${ApiConstants.baseUrl}/search.json?author=$query'),
      ),
    );
  }

  @override
  Future<SearchResultDto> searchWorksByTitle(String query) async {
    return SearchResultDto.fromJson(
      await _client.getJson(
        Uri.parse('${ApiConstants.baseUrl}/search.json?title=$query'),
      ),
    );
  }
}
