import 'package:open_library_app/features/books/books.dart';

class BookDetailsViewModel {
  final String title;
  final String author;
  final String coverUrl;
  final String coverLargeUrl;
  final String description;
  final int revisionCount;
  final List<String> subjects;
  final List<String> subjectPeople;
  final List<String> subjectPlaces;

  const BookDetailsViewModel({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.coverLargeUrl,
    required this.description,
    required this.revisionCount,
    required this.subjects,
    required this.subjectPeople,
    required this.subjectPlaces,
  });

  factory BookDetailsViewModel.fromBookDto(BookDto book) {
    return BookDetailsViewModel(
      title: book.title,
      author: book.authors.join(', '),
      coverUrl:
          'https://covers.openlibrary.org/b/id/${book.covers.first}-M.jpg',
      coverLargeUrl:
          'https://covers.openlibrary.org/b/id/${book.covers.first}-L.jpg',
      description: book.description ?? "",
      revisionCount: book.revision,
      subjects: book.subjects,
      subjectPeople: book.subject_people,
      subjectPlaces: book.subject_places,
    );
  }
}
