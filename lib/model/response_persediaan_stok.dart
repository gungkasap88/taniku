class ResponsePersediaanStok {
  bool? isSuccess;
  String? message;
  //List<Null>? data;
  String? error;

  ResponsePersediaanStok({this.isSuccess, this.message, this.error});

  ResponsePersediaanStok.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      //data = <Null>[];
      json['data'].forEach((v) {
        //data!.add(new Null.fromJson(v));
      });
    }
  }

  factory ResponsePersediaanStok.withError(String error) => ResponsePersediaanStok(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
