class DummyDto {
  final String? name;
  final String? event;

  DummyDto({this.name, this.event});

  factory DummyDto.fromJson(Map<String, dynamic> json) {
    return DummyDto(
      name: json['name'] as String?,
      event: json['event'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event': event,
    };
  }
}
