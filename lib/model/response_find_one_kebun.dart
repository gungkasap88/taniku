class FindOneKebun {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  FindOneKebun({this.isSuccess, this.message, this.data, this.error});

  FindOneKebun.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  factory FindOneKebun.withError(String error) => FindOneKebun(error: error);

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

class Data {
  int? id;
  int? petaniId;
  String? latitude;
  String? longitude;
  String? alamat;
  int? rt;
  int? rw;
  int? provinsiId;
  String? provinsiName;
  int? kabupatenKotaId;
  String? kabupatenKotaName;
  int? kecamatanId;
  String? kecamatanName;
  int? kelurahanId;
  String? kelurahanName;
  String? kodePos;
  String? luasKebun;
  String? jumlahPohon;
  String? potensiProduksi;
  String? tahunTanamId;
  String? jenisBibitId;
  String? jenisBibitName;
  int? statusLahanId;
  String? statusLahanName;
  Null? sertifikasiId;
  Null? noSertifikasi;
  Null? sertifikasiName;
  String? foto;
  Null? status;
  String? statusName;
  Null? sertifikasiNo;
  Null? sertifikasiDari;
  Null? sertifikasiSampai;
  Null? sertifikasiImage;

  Data(
      {this.id,
        this.petaniId,
        this.latitude,
        this.longitude,
        this.alamat,
        this.rt,
        this.rw,
        this.provinsiId,
        this.provinsiName,
        this.kabupatenKotaId,
        this.kabupatenKotaName,
        this.kecamatanId,
        this.kecamatanName,
        this.kelurahanId,
        this.kelurahanName,
        this.kodePos,
        this.luasKebun,
        this.jumlahPohon,
        this.potensiProduksi,
        this.tahunTanamId,
        this.jenisBibitId,
        this.jenisBibitName,
        this.statusLahanId,
        this.statusLahanName,
        this.sertifikasiId,
        this.noSertifikasi,
        this.sertifikasiName,
        this.foto,
        this.status,
        this.statusName,
        this.sertifikasiNo,
        this.sertifikasiDari,
        this.sertifikasiSampai,
        this.sertifikasiImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petaniId = json['petani_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    alamat = json['alamat'];
    rt = json['rt'];
    rw = json['rw'];
    provinsiId = json['provinsi_id'];
    provinsiName = json['provinsi_name'];
    kabupatenKotaId = json['kabupaten_kota_id'];
    kabupatenKotaName = json['kabupaten_kota_name'];
    kecamatanId = json['kecamatan_id'];
    kecamatanName = json['kecamatan_name'];
    kelurahanId = json['kelurahan_id'];
    kelurahanName = json['kelurahan_name'];
    kodePos = json['kode_pos'];
    luasKebun = json['luas_kebun'];
    jumlahPohon = json['jumlah_pohon'];
    potensiProduksi = json['potensi_produksi'];
    tahunTanamId = json['tahun_tanam_id'];
    jenisBibitId = json['jenis_bibit_id'];
    jenisBibitName = json['jenis_bibit_name'];
    statusLahanId = json['status_lahan_id'];
    statusLahanName = json['status_lahan_name'];
    sertifikasiId = json['sertifikasi_id'];
    noSertifikasi = json['no_sertifikasi'];
    sertifikasiName = json['sertifikasi_name'];
    foto = json['foto'];
    status = json['status'];
    statusName = json['status_name'];
    sertifikasiNo = json['sertifikasi_no'];
    sertifikasiDari = json['sertifikasi_dari'];
    sertifikasiSampai = json['sertifikasi_sampai'];
    sertifikasiImage = json['sertifikasi_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petani_id'] = this.petaniId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['alamat'] = this.alamat;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['provinsi_id'] = this.provinsiId;
    data['provinsi_name'] = this.provinsiName;
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    data['kecamatan_id'] = this.kecamatanId;
    data['kecamatan_name'] = this.kecamatanName;
    data['kelurahan_id'] = this.kelurahanId;
    data['kelurahan_name'] = this.kelurahanName;
    data['kode_pos'] = this.kodePos;
    data['luas_kebun'] = this.luasKebun;
    data['jumlah_pohon'] = this.jumlahPohon;
    data['potensi_produksi'] = this.potensiProduksi;
    data['tahun_tanam_id'] = this.tahunTanamId;
    data['jenis_bibit_id'] = this.jenisBibitId;
    data['jenis_bibit_name'] = this.jenisBibitName;
    data['status_lahan_id'] = this.statusLahanId;
    data['status_lahan_name'] = this.statusLahanName;
    data['sertifikasi_id'] = this.sertifikasiId;
    data['no_sertifikasi'] = this.noSertifikasi;
    data['sertifikasi_name'] = this.sertifikasiName;
    data['foto'] = this.foto;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['sertifikasi_no'] = this.sertifikasiNo;
    data['sertifikasi_dari'] = this.sertifikasiDari;
    data['sertifikasi_sampai'] = this.sertifikasiSampai;
    data['sertifikasi_image'] = this.sertifikasiImage;
    return data;
  }
}