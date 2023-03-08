class Trending {
  final String id;
  final String key;
  Trending({required this.id, required this.key});
  factory Trending.fromJson(Map<String, dynamic> json)
  {
    return Trending(
      id: json['cover_edition_key'] ?? 'OL40743344M',
      key: json['key']
    );
  }
}