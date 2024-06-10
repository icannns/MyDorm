class Keranjang {
  final int id;
  final String name;
  final String price;
  final String image;
  int quantity;
  bool selected;

  Keranjang({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.selected,
  });

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      selected: json['selected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'selected': selected,
    };
  }
}
