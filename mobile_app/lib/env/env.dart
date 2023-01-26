class Env {
  static const String _apiUrl = 'http://192.168.1.6:3000/api';
  static const String _wsUrl = 'http://192.168.1.6:3000';

  static Uri getURL(String path) {
    return Uri.parse('$_apiUrl$path');
  }

  static String getWS() {
    return _wsUrl;
  }
}
