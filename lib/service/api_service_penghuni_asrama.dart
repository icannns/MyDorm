import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/penghuni_asrama_model.dart';

class PenghuniAsramaApiService {
  final String apiUrl = 'http://localhost:3000/api/penghuni_asrama';

  Future<List<PenghuniAsrama>> getPenghuniAsrama() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => PenghuniAsrama.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load penghuni asrama');
    }
  }

  Future<PenghuniAsrama> addPenghuniAsrama(PenghuniAsrama penghuniAsrama) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(penghuniAsrama.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return PenghuniAsrama.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add penghuni asrama');
    }
  }

  Future<void> updatePenghuniAsrama(int id, PenghuniAsrama penghuniAsrama) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(penghuniAsrama.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update penghuni asrama');
    }
  }

  Future<void> deletePenghuniAsrama(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete penghuni asrama');
    }
  }
}
