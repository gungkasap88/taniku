class ResponseKecamatan {
  bool? isSuccess;
  String? message;
  List<DataKecamatan>? data;
  String? error;

  ResponseKecamatan({this.isSuccess, this.message, this.data, this.error});

  ResponseKecamatan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataKecamatan>[];
      json['data'].forEach((v) {
        data!.add(new DataKecamatan.fromJson(v));
      });
    }
  }

  factory ResponseKecamatan.withError(String error) => ResponseKecamatan(error: error);

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

class DataKecamatan {
  int? kecamatanId;
  int? kabupatenKotaId;
  String? kecamatanName;

  DataKecamatan({this.kecamatanId, this.kabupatenKotaId, this.kecamatanName});

  DataKecamatan.fromJson(Map<String, dynamic> json) {
    kecamatanId = json['kecamatan_id'];
    kabupatenKotaId = json['kabupaten_kota_id'];
    kecamatanName = json['kecamatan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kecamatan_id'] = this.kecamatanId;
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['kecamatan_name'] = this.kecamatanName;
    return data;
  }
}
