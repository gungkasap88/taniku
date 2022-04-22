class ResponseJenisBibit {
  bool? isSuccess;
  String? message;
  List<DataBibit>? data;
  String? error;

  ResponseJenisBibit({this.isSuccess, this.message, this.data, this.error});

  ResponseJenisBibit.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataBibit>[];
      json['data'].forEach((v) {
        data!.add(new DataBibit.fromJson(v));
      });
    }
  }

  factory ResponseJenisBibit.withError(String error) => ResponseJenisBibit(error: error);

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

class DataBibit {
  int? jenisBibitId;
  Null? jenisBibit;
  String? jenisBibitName;
  Null? keteranganBibit;

  DataBibit(
      {this.jenisBibitId,
        this.jenisBibit,
        this.jenisBibitName,
        this.keteranganBibit});

  DataBibit.fromJson(Map<String, dynamic> json) {
    jenisBibitId = json['jenis_bibit_id'];
    jenisBibit = json['jenis_bibit'];
    jenisBibitName = json['jenis_bibit_name'];
    keteranganBibit = json['keterangan_bibit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jenis_bibit_id'] = this.jenisBibitId;
    data['jenis_bibit'] = this.jenisBibit;
    data['jenis_bibit_name'] = this.jenisBibitName;
    data['keterangan_bibit'] = this.keteranganBibit;
    return data;
  }
}
