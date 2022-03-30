class Environment {
  static const String baseUri = "http://baseurl.net/";
  static late String token;
  static Map<String, String> apiHeader = {
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  };
}
