class Keyword {
  final int id;
  final String name;

  Keyword({required this.id, required this.name});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'] as int,
      name: json['original_language'] as String,
    );
  }
}
