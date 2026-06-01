class KeyDto {
  final String key;

  const KeyDto({required this.key});

  factory KeyDto.fromJson(Map<String, dynamic> json) {
    return KeyDto(key: json['key'] as String? ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'key': key};
  }
}
