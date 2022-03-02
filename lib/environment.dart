class Environment {
  static const String baseUri = "http://test20.internative.net/";
  static late String token;
  static late String expiration;
  static var apiHeader = {
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  };
}
