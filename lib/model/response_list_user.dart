import 'dart:typed_data';

class ListUserModel {
  int? id;
  String? sertifikat;
  String? nosertifikat;
  String? tanggal;
  Uint8List? foto;

  ListUserModel(
      {this.id,
        this.sertifikat,
        this.nosertifikat,
        this.tanggal,
        this.foto
      });

  ListUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sertifikat = json['sertifikat'];
    nosertifikat = json['nosertifikat'];
    tanggal = json['tanggal'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sertifikat'] = sertifikat;
    data['nosertifikat'] = nosertifikat;
    data['tanggal'] = tanggal;
    data['foto'] = foto;
    return data;
  }
}