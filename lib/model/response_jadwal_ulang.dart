class ResponseJadwalUlang {
  bool? isSuccess;
  String? message;
  String? error;

  ResponseJadwalUlang({this.isSuccess, this.message, this.error});

  ResponseJadwalUlang.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  factory ResponseJadwalUlang.withError(String error) => ResponseJadwalUlang(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}
