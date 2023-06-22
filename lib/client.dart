import 'package:http/http.dart' as http;

class Client {
  static Future<dynamic> fetchAll() async {
    final uri = Uri.parse('https://www.freetogame.com/api/games');
    final response = await http.get(uri);
    return response;
  }
}
