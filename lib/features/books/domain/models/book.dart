import 'package:open_library_app/features/books/data/models/book_dto.dart';

class Book {
  final String id;
  final String title;
  final String? description;
  final bool hasCover;
  final String? coverUrlSmall;
  final String? coverUrlMedium;
  final String? coverUrlLarge;
  final List<String> authors;

  const Book({
    required this.id,
    required this.title,
    this.description,
    required this.hasCover,
    this.coverUrlSmall,
    this.coverUrlMedium,
    this.coverUrlLarge,
    required this.authors,
  });

  factory Book.fromDto(BookDto dto) {
    final firstCoverId = dto.covers.isNotEmpty ? dto.covers.first : null;

    return Book(
      id: dto.key,
      title: dto.title,
      description: dto.description,
      hasCover: firstCoverId != null,
      coverUrlSmall: firstCoverId != null
          ? 'https://covers.openlibrary.org/b/id/$firstCoverId-S.jpg'
          : null,
      coverUrlMedium: firstCoverId != null
          ? 'https://covers.openlibrary.org/b/id/$firstCoverId-M.jpg'
          : null,
      coverUrlLarge: firstCoverId != null
          ? 'https://covers.openlibrary.org/b/id/$firstCoverId-L.jpg'
          : null,
      authors: dto.authors.map((a) => a.author.toString()).toList(),
    );
  }
}
