import 'package:open_library_app/features/books/data/models/key_dto.dart';

class AuthorRoleDto {
  final KeyDto? type;
  final KeyDto? author;

  const AuthorRoleDto({this.type, this.author});

  factory AuthorRoleDto.fromJson(Map<String, dynamic> json) {
    return AuthorRoleDto(
      type: json['type'] != null ? KeyDto.fromJson(json['type']) : null,
      author: json['author'] != null ? KeyDto.fromJson(json['author']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type?.toJson(), 'author': author?.toJson()};
  }
}
