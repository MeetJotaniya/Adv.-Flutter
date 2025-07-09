import 'dart:convert';
import 'package:adv_flutter_lab/Lab11/user_api_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  String baseUrl="https://686ddc1cc9090c495387725f.mockapi.io/users";

  Future<List<UserApiModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}