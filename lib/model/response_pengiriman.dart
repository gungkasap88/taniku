class ResponsePengiriman {
  bool? isSuccess;
  String? message;
  int? totalPage;
  int? totalData;
  List<Data>? data;
  String? error;

  ResponsePengiriman(
      {this.isSuccess,
        this.message,
        this.totalPage,
        this.totalData,
        this.data,
        this.error
      });

  ResponsePengiriman.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    totalPage = json['totalPage'];
    totalData = json['totalData'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  factory ResponsePengiriman.withError(String error) => ResponsePengiriman(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    data['totalPage'] = this.totalPage;
    data['totalData'] = this.totalData;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? noReservasi;
  String? noInvoice;
  int? pabrikId;
  String? namaPabrik;
  String? tonasi;
  String? tanggalPengiriman;
  int? petaniId;
  String? nama;
  Null? koperasiId;
  Null? namaKoperasi;
  String? status;
  String? statusName;
  String? rowStatus;
  String? createdDate;

  Data(
      {this.id,
        this.noReservasi,
        this.noInvoice,
        this.pabrikId,
        this.namaPabrik,
        this.tonasi,
        this.tanggalPengiriman,
        this.petaniId,
        this.nama,
        this.koperasiId,
        this.namaKoperasi,
        this.status,
        this.statusName,
        this.rowStatus,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noReservasi = json['no_reservasi'];
    noInvoice = json['no_invoice'];
    pabrikId = json['pabrik_id'];
    namaPabrik = json['nama_pabrik'];
    tonasi = json['tonasi'];
    tanggalPengiriman = json['tanggal_pengiriman'];
    petaniId = json['petani_id'];
    nama = json['nama'];
    koperasiId = json['koperasi_id'];
    namaKoperasi = json['nama_koperasi'];
    status = json['status'];
    statusName = json['status_name'];
    rowStatus = json['row_status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_reservasi'] = this.noReservasi;
    data['no_invoice'] = this.noInvoice;
    data['pabrik_id'] = this.pabrikId;
    data['nama_pabrik'] = this.namaPabrik;
    data['tonasi'] = this.tonasi;
    data['tanggal_pengiriman'] = this.tanggalPengiriman;
    data['petani_id'] = this.petaniId;
    data['nama'] = this.nama;
    data['koperasi_id'] = this.koperasiId;
    data['nama_koperasi'] = this.namaKoperasi;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['row_status'] = this.rowStatus;
    data['created_date'] = this.createdDate;
    return data;
  }
}
