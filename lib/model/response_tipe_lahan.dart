class ResponseTipeLahan {
  bool? isSuccess;
  String? message;
  List<DataTipe>? data;
  String? error;

  ResponseTipeLahan({this.isSuccess, this.message, this.data, this.error});

  ResponseTipeLahan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataTipe>[];
      json['data'].forEach((v) {
        data!.add(new DataTipe.fromJson(v));
      });
    }
  }

  factory ResponseTipeLahan.withError(String error) => ResponseTipeLahan(error: error);

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

class DataTipe {
  int? statusLahanId;
  String? statusLahanName;

  DataTipe({this.statusLahanId, this.statusLahanName});

  DataTipe.fromJson(Map<String, dynamic> json) {
    statusLahanId = json['status_lahan_id'];
    statusLahanName = json['status_lahan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_lahan_id'] = this.statusLahanId;
    data['status_lahan_name'] = this.statusLahanName;
    return data;
  }
}
