class ServerConfig{
  /// BASE_URL
  static String prodImgUrl = "https://ishatiprod.softcube.co.in/";
  static String qaImgUrl = "https://ishatiqa.softcube.co.in/";
  static String imageUrl = prodImgUrl;
  static String qa = "https://ishatiqa.softcube.co.in/api/v1";
  static String pod = "https://themedico.app/api";
  static String baseUrl = pod;

  /// API_URL
  static String get csrfTokenUrl => "$baseUrl/csrf-token";
  static String get loginUrl => "$baseUrl/auth/login";
  static String get registerUrl => "$baseUrl/restaurant_user/sign_up";
  static String get getUserUrl => "$baseUrl/user";
  static String get logoutUrl => "$baseUrl/auth/logout";

  //Home_Url
  static String get getNotificationUrl => "$baseUrl/notifications";
  static String get getRecommendUrl=> "$baseUrl/recommendations";



}