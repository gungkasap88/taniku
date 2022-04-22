class ListDokumenModel {
  int? id;
  String? dokumen;
  String? nodokumen;

  ListDokumenModel(
      {this.id,
        this.dokumen,
        this.nodokumen,});

  ListDokumenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dokumen = json['dokumen'];
    nodokumen = json['nodokumen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dokumen'] = dokumen;
    data['nodokumen'] = nodokumen;
    return data;
  }
}