class DateTimeValueDto {
  final String type;
  final String value;

  const DateTimeValueDto({required this.type, required this.value});

  factory DateTimeValueDto.fromJson(Map<String, dynamic> json) {
    return DateTimeValueDto(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }
}
