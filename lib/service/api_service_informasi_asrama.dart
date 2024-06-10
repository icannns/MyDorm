import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/informasi_asrama_model.dart';

class InformasiAsramaApiService {
  final String apiUrl = "http://localhost:3000/api";

  // Mendapatkan informasi asrama
  Future<List<InformasiAsrama>> getInformasiAsrama() async {
    final response = await http.get(Uri.parse('$apiUrl/informasi-asrama'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => InformasiAsrama.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load informasi asrama');
    }
  }

  // Menambahkan informasi asrama
  Future<InformasiAsrama> addInformasiAsrama(InformasiAsrama informasi) async {
    final response = await http.post(
      Uri.parse('$apiUrl/informasi-asrama'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(informasi.toJson()),
    );
    if (response.statusCode == 200) {
      return InformasiAsrama.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add informasi asrama');
    }
  }

  // Mengupdate informasi asrama
  Future<InformasiAsrama> updateInformasiAsrama(int id, InformasiAsrama informasi) async {
    final response = await http.put(
      Uri.parse('$apiUrl/informasi-asrama/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(informasi.toJson()),
    );
    if (response.statusCode == 200) {
      return InformasiAsrama.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update informasi asrama');
    }
  }

  // Menghapus informasi asrama
  Future<void> deleteInformasiAsrama(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/informasi-asrama/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete informasi asrama');
    }
  }
}
