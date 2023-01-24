class Env {
  static String apiUrl = 'http://192.168.1.6:3000/api';
  static String wsUrl = 'http://192.168.1.6:3000/ws';

  static Uri getURL(String path) {
    return Uri.parse('$apiUrl$path');
  }
}
