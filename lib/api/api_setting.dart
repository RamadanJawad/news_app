class ApiSetting {
  static const String key = "Add Your Api Key";
  static const String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=eg&&apiKey=$key";

  static String getNewsByCategory(String category) {
    return "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$key";
  }
}
