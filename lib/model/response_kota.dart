class ResponseKota {
  bool? isSuccess;
  String? message;
  List<DataKota>? data;
  String? error;

  ResponseKota({this.isSuccess, this.message, this.data, this.error});

  ResponseKota.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataKota>[];
      json['data'].forEach((v) {
        data!.add(new DataKota.fromJson(v));
      });
    }
  }

  factory ResponseKota.withError(String error) => ResponseKota(error: error);

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

class DataKota {
  int? kabupatenKotaId;
  int? provinsiId;
  String? kabupatenKotaName;

  DataKota({this.kabupatenKotaId, this.provinsiId, this.kabupatenKotaName});

  DataKota.fromJson(Map<String, dynamic> json) {
    kabupatenKotaId = json['kabupaten_kota_id'];
    provinsiId = json['provinsi_id'];
    kabupatenKotaName = json['kabupaten_kota_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['provinsi_id'] = this.provinsiId;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    return data;
  }
}
