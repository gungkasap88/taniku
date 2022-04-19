class ResponseKelurahan {
  bool? isSuccess;
  String? message;
  List<DataKelurahan>? data;
  String? error;

  ResponseKelurahan({this.isSuccess, this.message, this.data, this.error});

  ResponseKelurahan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataKelurahan>[];
      json['data'].forEach((v) {
        data!.add(new DataKelurahan.fromJson(v));
      });
    }
  }

  factory ResponseKelurahan.withError(String error) => ResponseKelurahan(error: error);

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

class DataKelurahan {
  int? kelurahanDesaId;
  int? kecamatanId;
  String? kelurahanDesaName;
  int? kodePos;

  DataKelurahan(
      {this.kelurahanDesaId,
        this.kecamatanId,
        this.kelurahanDesaName,
        this.kodePos});

  DataKelurahan.fromJson(Map<String, dynamic> json) {
    kelurahanDesaId = json['kelurahan_desa_id'];
    kecamatanId = json['kecamatan_id'];
    kelurahanDesaName = json['kelurahan_desa_name'];
    kodePos = json['kode_pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelurahan_desa_id'] = this.kelurahanDesaId;
    data['kecamatan_id'] = this.kecamatanId;
    data['kelurahan_desa_name'] = this.kelurahanDesaName;
    data['kode_pos'] = this.kodePos;
    return data;
  }
}
