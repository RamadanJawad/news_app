class ApiSetting {
  static const String key = "854be9e1980643a9bbcca155fdffd95c";
  static const String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=eg&&apiKey=$key";

  static String getNewsByCategory(String category) {
    return "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$key";
  }
}
