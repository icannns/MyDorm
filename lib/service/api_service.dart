import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/product_model.dart';

class ApiService {
  final String apiUrl = "http://localhost:3000/api";

  // Produk
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$apiUrl/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$apiUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<Product> updateProduct(int id, Product product) async {
    final response = await http.put(
      Uri.parse('$apiUrl/products/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/products/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete product');
    }
  }
}
