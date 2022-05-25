class SearchResult {
  String name;
  String region;
  String country;
  double latitude = 0;
  double longitude = 0;

  SearchResult({
    required this.name,
    required this.region,
    required this.country,
  });

  factory SearchResult.fromJson(Map<String, dynamic> jsonData) {
    return SearchResult(
        name: jsonData['name'] as String,
        region: jsonData['region'] as String,
        country: jsonData['country'] as String);
  }
}
