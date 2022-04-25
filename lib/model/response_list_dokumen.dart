import 'dart:typed_data';

class ListDokumenModel {
  int? id;
  String? dokumen;
  String? nodokumen;
  Uint8List? foto;

  ListDokumenModel(
      {this.id,
        this.dokumen,
        this.nodokumen,
        this.foto,
      });

  ListDokumenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dokumen = json['dokumen'];
    nodokumen = json['nodokumen'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dokumen'] = dokumen;
    data['nodokumen'] = nodokumen;
    data['foto'] = foto;
    return data;
  }
}