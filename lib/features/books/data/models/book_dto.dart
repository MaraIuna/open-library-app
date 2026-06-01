import 'package:open_library_app/features/books/data/models/author_role_dto.dart';
import 'package:open_library_app/features/books/data/models/datetime_value_dto.dart';
import 'package:open_library_app/features/books/data/models/key_dto.dart';

class BookDto {
  final String? description;
  final DateTimeValueDto? last_modified;
  final String title;
  final DateTimeValueDto? created;
  final List<int> covers;
  final List<String> subject_places;
  final List<String> subjects;
  final List<String> subject_people;
  final String key;
  final List<AuthorRoleDto> authors;
  final int latest_revision;
  final KeyDto? type;
  final int revision;

  const BookDto({
    this.description,
    this.last_modified,
    required this.title,
    this.created,
    required this.covers,
    required this.subject_places,
    required this.subjects,
    required this.subject_people,
    required this.key,
    required this.authors,
    required this.latest_revision,
    this.type,
    required this.revision,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) {
    return BookDto(
      description: json['description'] is String?
          ? json['description']
          : (json['description']?['value'] as String?) ?? '',
      last_modified: json['last_modified'] != null
          ? DateTimeValueDto.fromJson(json['last_modified'])
          : null,
      title: json['title'] as String? ?? '',
      created: json['created'] != null
          ? DateTimeValueDto.fromJson(json['created'])
          : null,
      covers:
          (json['covers'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
      subject_places:
          (json['subject_places'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      subjects:
          (json['subjects'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      subject_people:
          (json['subject_people'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      key: json['key'] as String? ?? '',
      authors:
          (json['authors'] as List<dynamic>?)
              ?.map((e) => AuthorRoleDto.fromJson(e))
              .toList() ??
          [],
      latest_revision: json['latest_revision'] as int? ?? 0,
      type: json['type'] != null ? KeyDto.fromJson(json['type']) : null,
      revision: json['revision'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'last_modified': last_modified?.toJson(),
      'title': title,
      'created': created?.toJson(),
      'covers': covers,
      'subject_places': subject_places,
      'subjects': subjects,
      'subject_people': subject_people,
      'key': key,
      'authors': authors.map((e) => e.toJson()).toList(),
      'latest_revision': latest_revision,
      'type': type?.toJson(),
      'revision': revision,
    };
  }
}
