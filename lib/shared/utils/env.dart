abstract class EnvConfig {
  static String baseUrl = const String.fromEnvironment("BASEURL");
  static String mapApyKey = const String.fromEnvironment("MAPKEY");
  static String geoRutasApyKey = const String.fromEnvironment("GEORUTASAPYKEY");
}
