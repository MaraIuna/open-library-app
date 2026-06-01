class TextValueDto {
  final String type;
  final String value;

  const TextValueDto({required this.type, required this.value});

  factory TextValueDto.fromJson(Map<String, dynamic> json) {
    return TextValueDto(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}
