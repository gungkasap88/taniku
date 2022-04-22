class ResponseSertifikasi {
  bool? isSuccess;
  String? message;
  List<DataSertifikasi>? data;
  String? error;

  ResponseSertifikasi({this.isSuccess, this.message, this.data, this.error});

  ResponseSertifikasi.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSertifikasi>[];
      json['data'].forEach((v) {
        data!.add(new DataSertifikasi.fromJson(v));
      });
    }
  }

  factory ResponseSertifikasi.withError(String error) => ResponseSertifikasi(error: error);

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

class DataSertifikasi {
  int? sertifikasiId;
  String? sertifikasiName;

  DataSertifikasi({this.sertifikasiId, this.sertifikasiName});

  DataSertifikasi.fromJson(Map<String, dynamic> json) {
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    return data;
  }
}
