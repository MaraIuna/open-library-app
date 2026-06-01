class WorkDto {
  final int? cover_i;
  final bool has_fulltext;
  final int edition_count;
  final String title;
  final List<String> author_name;
  final int? first_publish_year;
  final String key;
  final List<String> ia;
  final List<String> author_key;
  final bool public_scan_b;

  const WorkDto({
    this.cover_i,
    required this.has_fulltext,
    required this.edition_count,
    required this.title,
    required this.author_name,
    this.first_publish_year,
    required this.key,
    required this.ia,
    required this.author_key,
    required this.public_scan_b,
  });

  factory WorkDto.fromJson(Map<String, dynamic> json) {
    return WorkDto(
      cover_i: json['cover_i'] as int?,
      has_fulltext: json['has_fulltext'] as bool? ?? false,
      edition_count: json['edition_count'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      author_name:
          (json['author_name'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      first_publish_year: json['first_publish_year'] as int?,
      key: json['key'] as String? ?? '',
      ia:
          (json['ia'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          [],
      author_key:
          (json['author_key'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      public_scan_b: json['public_scan_b'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cover_i': cover_i,
      'has_fulltext': has_fulltext,
      'edition_count': edition_count,
      'title': title,
      'author_name': author_name,
      'first_publish_year': first_publish_year,
      'key': key,
      'ia': ia,
      'author_key': author_key,
      'public_scan_b': public_scan_b,
    };
  }
}
