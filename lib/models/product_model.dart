class Product {
  final int? id;
  final String name;
  final String price; // jika price seharusnya adalah int, ubah ke int
  final String stock; // jika stock seharusnya adalah int, ubah ke int
  final String category;
  final String description;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toString(), // konversi ke string jika diperlukan
      stock: json['stock'].toString(), // konversi ke string jika diperlukan
      category: json['category'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'category': category,
      'description': description,
    };
  }
}
