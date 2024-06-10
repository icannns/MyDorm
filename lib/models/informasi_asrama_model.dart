class InformasiAsrama {
  final int id;
  final String judul;
  final String deskripsi;
  final String gambar;

  InformasiAsrama({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.gambar,
  });

  factory InformasiAsrama.fromJson(Map<String, dynamic> json) {
    return InformasiAsrama(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'gambar': gambar,
    };
  }
}
