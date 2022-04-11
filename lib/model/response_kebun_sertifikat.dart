class KebunSertifikat {
  bool? isSuccess;
  String? message;
  List<DataS>? data;
  String? error;

  KebunSertifikat({this.isSuccess, this.message, this.data, this.error});

  KebunSertifikat.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataS>[];
      json['data'].forEach((v) {
        data!.add(new DataS.fromJson(v));
      });
    }
  }

  factory KebunSertifikat.withError(String error) => KebunSertifikat(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataS {
  int? id;
  int? kebunId;
  int? dokumenId;
  String? dokumenName;
  String? dokumenJenis;
  Null? dokumenNoBlanko;
  String? dokumenBerlakuDari;
  String? dokumenBerlakuSampai;
  String? nomor;
  String? foto;
  String? rowStatus;

  DataS(
      {this.id,
        this.kebunId,
        this.dokumenId,
        this.dokumenName,
        this.dokumenJenis,
        this.dokumenNoBlanko,
        this.dokumenBerlakuDari,
        this.dokumenBerlakuSampai,
        this.nomor,
        this.foto,
        this.rowStatus});

  DataS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kebunId = json['kebun_id'];
    dokumenId = json['dokumen_id'];
    dokumenName = json['dokumen_name'];
    dokumenJenis = json['dokumen_jenis'];
    dokumenNoBlanko = json['dokumen_no_blanko'];
    dokumenBerlakuDari = json['dokumen_berlaku_dari'];
    dokumenBerlakuSampai = json['dokumen_berlaku_sampai'];
    nomor = json['nomor'];
    foto = json['foto'];
    rowStatus = json['row_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kebun_id'] = this.kebunId;
    data['dokumen_id'] = this.dokumenId;
    data['dokumen_name'] = this.dokumenName;
    data['dokumen_jenis'] = this.dokumenJenis;
    data['dokumen_no_blanko'] = this.dokumenNoBlanko;
    data['dokumen_berlaku_dari'] = this.dokumenBerlakuDari;
    data['dokumen_berlaku_sampai'] = this.dokumenBerlakuSampai;
    data['nomor'] = this.nomor;
    data['foto'] = this.foto;
    data['row_status'] = this.rowStatus;
    return data;
  }
}
