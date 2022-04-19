class ResponseProvinsi {
  bool? isSuccess;
  String? message;
  List<DataProvinsi>? data;
  String? error;

  ResponseProvinsi({this.isSuccess, this.message, this.data, this.error});

  ResponseProvinsi.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataProvinsi>[];
      json['data'].forEach((v) {
        data!.add(new DataProvinsi.fromJson(v));
      });
    }
  }

  factory ResponseProvinsi.withError(String error) => ResponseProvinsi(error: error);

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

class DataProvinsi {
  int? provinsiId;
  String? provinsiName;

  DataProvinsi({this.provinsiId, this.provinsiName});

  DataProvinsi.fromJson(Map<String, dynamic> json) {
    provinsiId = json['provinsi_id'];
    provinsiName = json['provinsi_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinsi_id'] = this.provinsiId;
    data['provinsi_name'] = this.provinsiName;
    return data;
  }
}
