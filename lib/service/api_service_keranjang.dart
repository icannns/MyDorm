import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/keranjang_model.dart';

class KeranjangApiService {
  final String apiUrl = "http://10.0.2.2:3000/api";

  // Mendapatkan produk dalam keranjang
  Future<List<Keranjang>> getKeranjang() async {
    final response = await http
        .get(Uri.parse('$apiUrl/keranjang'))
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Keranjang.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load keranjang');
    }
  }

  // Menambahkan produk ke keranjang
  Future<Keranjang> addToKeranjang(Keranjang keranjang) async {
    final response = await http
        .post(
          Uri.parse('$apiUrl/keranjang'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(keranjang.toJson()),
        )
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return Keranjang.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add to keranjang');
    }
  }

  // Mengupdate produk dalam keranjang
  Future<Keranjang> updateKeranjang(int id, Keranjang keranjang) async {
    final response = await http
        .put(
          Uri.parse('$apiUrl/keranjang/$id'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(keranjang.toJson()),
        )
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return Keranjang.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update keranjang');
    }
  }

  // Menghapus produk dari keranjang
  Future<void> deleteFromKeranjang(int id) async {
    final response = await http
        .delete(Uri.parse('$apiUrl/keranjang/$id'))
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete from keranjang');
    }
  }
}
