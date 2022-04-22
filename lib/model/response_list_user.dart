class ListUserModel {
  int? id;
  String? sertifikat;
  String? nosertifikat;

  ListUserModel(
      {this.id,
        this.sertifikat,
        this.nosertifikat,});

  ListUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sertifikat = json['sertifikat'];
    nosertifikat = json['nosertifikat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sertifikat'] = sertifikat;
    data['nosertifikat'] = nosertifikat;
    return data;
  }
}