import 'package:open_library_app/features/books/data/models/work_dto.dart';

class SearchBook {
  final String olid;
  final String title;
  final List<String> authors;

  final bool hasCover;
  final String? thumbnailUrl;
  final String? coverUrl;
  final String? coverLargeUrl;

  final int? firstPublishYear;
  final int editionCount;

  const SearchBook({
    required this.olid,
    required this.title,
    required this.authors,
    required this.hasCover,
    this.thumbnailUrl,
    this.coverUrl,
    this.coverLargeUrl,
    this.firstPublishYear,
    required this.editionCount,
  });

  factory SearchBook.fromDto(WorkDto dto) {
    return SearchBook(
      olid: dto.key.split("/")[2], // pattern: /works/ID -> ID on index 2,
      title: dto.title,
      authors: dto.author_name,
      hasCover: dto.cover_i != null,
      thumbnailUrl: dto.cover_i != null
          ? 'https://covers.openlibrary.org/b/id/${dto.cover_i}-S.jpg'
          : null,
      coverUrl: dto.cover_i != null
          ? 'https://covers.openlibrary.org/b/id/${dto.cover_i}-M.jpg'
          : null,
      coverLargeUrl: dto.cover_i != null
          ? 'https://covers.openlibrary.org/b/id/${dto.cover_i}-L.jpg'
          : null,
      firstPublishYear: dto.first_publish_year,
      editionCount: dto.edition_count,
    );
  }
}
