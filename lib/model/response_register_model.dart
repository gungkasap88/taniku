class respon_register_model {
  int? code;
  bool? isSuccess;
  String? message;
  String? error;

  respon_register_model({this.code, this.isSuccess, this.message, this.error});

  respon_register_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    isSuccess = json['isSuccess'];
    message = json['message'];
  }
  factory respon_register_model.withError(String error) => respon_register_model(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}
