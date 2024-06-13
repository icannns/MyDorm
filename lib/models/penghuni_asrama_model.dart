class PenghuniAsrama {
  final int? id;
  final int idPenghuniAsrama;
  final String nama;
  final String gedung;
  final int lantai;
  final int nomorKamar;
  final int nomorKasur;
  final String nomorToken;

  PenghuniAsrama({
    this.id,
    required this.idPenghuniAsrama,
    required this.nama,
    required this.gedung,
    required this.lantai,
    required this.nomorKamar,
    required this.nomorKasur,
    required this.nomorToken,
  });

  factory PenghuniAsrama.fromJson(Map<String, dynamic> json) {
    return PenghuniAsrama(
      id: json['id'],
      idPenghuniAsrama: json['idPenghuniAsrama'],
      nama: json['nama'],
      gedung: json['gedung'],
      lantai: json['lantai'],
      nomorKamar: json['nomorKamar'],
      nomorKasur: json['nomorKasur'],
      nomorToken: json['nomorToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPenghuniAsrama': idPenghuniAsrama,
      'nama': nama,
      'gedung': gedung,
      'lantai': lantai,
      'nomorKamar': nomorKamar,
      'nomorKasur': nomorKasur,
      'nomorToken': nomorToken,
    };
  }
}
