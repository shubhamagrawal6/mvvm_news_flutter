class Constants {
  static const String api_key = ''; // Insert your API key over here
  static const String top_headlines_URL =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$api_key';
  static String headlinesFor({String country, String category}) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$api_key';
  }

  static const Map<String, String> Countries = {
    "USA": "us",
    "India": "in",
    "Korea": "kr",
    "Japan": "jp",
    "New Zealand": "nz"
  };
  static const Map<String, String> Categories = {
    "General": "general",
    "Technology": "technology",
    "Business": "business",
    "Health": "health",
    "Science": "science",
    "Sports": "sports"
  };
}
