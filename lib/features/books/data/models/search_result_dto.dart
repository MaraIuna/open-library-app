import 'work_dto.dart';

class SearchResultDto {
  final int start;
  final int num_found;
  final List<WorkDto> docs;

  const SearchResultDto({
    required this.start,
    required this.num_found,
    required this.docs,
  });

  factory SearchResultDto.fromJson(Map<String, dynamic> json) {
    return SearchResultDto(
      start: json['start'] as int? ?? 0,
      num_found: json['num_found'] as int? ?? 0,
      docs:
          (json['docs'] as List<dynamic>?)
              ?.map((e) => WorkDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'num_found': num_found,
      'docs': docs.map((e) => e.toJson()).toList(),
    };
  }
}
