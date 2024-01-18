import 'dart:convert';
import 'package:http/http.dart' as http;

class RecommendationSystem {
  final String apiUrl = 'https://96b5-110-172-23-161.ngrok-free.app/';

  Future<List<Map<String, dynamic>>> getRecommendations(
      String location,
      String language,
      String disability,
      String jobPreference,
      String perks) async {
    String userProfile =
        "$location%20$language%20$jobPreference%20$disability%20$perks";

    final response = await http.get(
      Uri.parse('$apiUrl?user_profle=$userProfile'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      List<dynamic> data = json.decode(response.body)['data'];
      List<Map<String, dynamic>> recommendations =
          List<Map<String, dynamic>>.from(data);
      return recommendations;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load recommendations');
    }
  }
}