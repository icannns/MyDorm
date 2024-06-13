import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/informasi_asrama_model.dart';

class InformasiAsramaApiService {
  final String apiUrl = "http://localhost:3000/api";

  Future<List<InformasiAsrama>> getInformasiAsrama() async {
    final response = await http.get(Uri.parse('$apiUrl/informasi_asrama'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => InformasiAsrama.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load informasi asrama');
    }
  }

  Future<void> addInformasiAsrama(InformasiAsrama informasiAsrama) async {
    final response = await http.post(
      Uri.parse('$apiUrl/informasi_asrama'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(informasiAsrama.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add informasi asrama');
    }
  }

  Future<void> updateInformasiAsrama(int id, InformasiAsrama informasiAsrama) async {
    final response = await http.put(
      Uri.parse('$apiUrl/informasi_asrama/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(informasiAsrama.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update informasi asrama');
    }
  }

  Future<void> deleteInformasiAsrama(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/informasi_asrama/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete informasi asrama');
    }
  }
}
