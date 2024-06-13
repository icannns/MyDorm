class InformasiAsrama {
  final int id;
  final String judul;
  final String deskripsi;

  InformasiAsrama({
    required this.id,
    required this.judul,
    required this.deskripsi,
  });

  factory InformasiAsrama.fromJson(Map<String, dynamic> json) {
    return InformasiAsrama(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
    };
  }
}
