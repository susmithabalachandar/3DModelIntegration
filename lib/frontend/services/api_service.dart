import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plant_model.dart';

class ApiService {
  final String baseUrl = "http://localhost:3000";

  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Plant.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load plants');
    }
  }
}
