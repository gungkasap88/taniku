class ResponseTransaksi {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  ResponseTransaksi({this.isSuccess, this.message, this.data, this.error});

  ResponseTransaksi.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  factory ResponseTransaksi.withError(String error) => ResponseTransaksi(error: error);

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
  int? parentPabrikId;
  String? namaPabrik;
  String? jumlahKaryawan;
  Null? website;
  String? latitude;
  String? longitude;
  String? alamat;
  int? provinsiId;
  String? provinsiName;
  int? kabupatenKotaId;
  Null? kabupatenKotaName;
  int? kecamatanId;
  Null? kecamatanName;
  int? kelurahanId;
  Null? kelurahanName;
  String? kodePos;
  String? kapasitas;
  Null? npwp;
  Null? noIzinUsaha;
  Null? siup;
  Null? akte;
  Null? bankId;
  Null? bankName;
  Null? akunBank;
  Null? noRekening;
  String? rowStatus;
  String? foto;
  String? kuota;
  int? koutaTerisi;
  double? jarakPabrik;
  String? jamBuka;
  String? jamTutup;
  String? periodePemeliharaan;
  String? mulaiOperasi;
  String? harga;

  Data(
      {this.id,
        this.parentPabrikId,
        this.namaPabrik,
        this.jumlahKaryawan,
        this.website,
        this.latitude,
        this.longitude,
        this.alamat,
        this.provinsiId,
        this.provinsiName,
        this.kabupatenKotaId,
        this.kabupatenKotaName,
        this.kecamatanId,
        this.kecamatanName,
        this.kelurahanId,
        this.kelurahanName,
        this.kodePos,
        this.kapasitas,
        this.npwp,
        this.noIzinUsaha,
        this.siup,
        this.akte,
        this.bankId,
        this.bankName,
        this.akunBank,
        this.noRekening,
        this.rowStatus,
        this.foto,
        this.kuota,
        this.koutaTerisi,
        this.jarakPabrik,
        this.jamBuka,
        this.jamTutup,
        this.periodePemeliharaan,
        this.mulaiOperasi,
        this.harga});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentPabrikId = json['parent_pabrik_id'];
    namaPabrik = json['nama_pabrik'];
    jumlahKaryawan = json['jumlah_karyawan'];
    website = json['website'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    alamat = json['alamat'];
    provinsiId = json['provinsi_id'];
    provinsiName = json['provinsi_name'];
    kabupatenKotaId = json['kabupaten_kota_id'];
    kabupatenKotaName = json['kabupaten_kota_name'];
    kecamatanId = json['kecamatan_id'];
    kecamatanName = json['kecamatan_name'];
    kelurahanId = json['kelurahan_id'];
    kelurahanName = json['kelurahan_name'];
    kodePos = json['kode_pos'];
    kapasitas = json['kapasitas'];
    npwp = json['npwp'];
    noIzinUsaha = json['no_izin_usaha'];
    siup = json['siup'];
    akte = json['akte'];
    bankId = json['bank_id'];
    bankName = json['bank_name'];
    akunBank = json['akun_bank'];
    noRekening = json['no_rekening'];
    rowStatus = json['row_status'];
    foto = json['foto'];
    kuota = json['kuota'];
    koutaTerisi = json['kouta_terisi'];
    jarakPabrik = json['jarak_pabrik'];
    jamBuka = json['jam_buka'];
    jamTutup = json['jam_tutup'];
    periodePemeliharaan = json['periode_pemeliharaan'];
    mulaiOperasi = json['mulai_operasi'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_pabrik_id'] = this.parentPabrikId;
    data['nama_pabrik'] = this.namaPabrik;
    data['jumlah_karyawan'] = this.jumlahKaryawan;
    data['website'] = this.website;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['alamat'] = this.alamat;
    data['provinsi_id'] = this.provinsiId;
    data['provinsi_name'] = this.provinsiName;
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    data['kecamatan_id'] = this.kecamatanId;
    data['kecamatan_name'] = this.kecamatanName;
    data['kelurahan_id'] = this.kelurahanId;
    data['kelurahan_name'] = this.kelurahanName;
    data['kode_pos'] = this.kodePos;
    data['kapasitas'] = this.kapasitas;
    data['npwp'] = this.npwp;
    data['no_izin_usaha'] = this.noIzinUsaha;
    data['siup'] = this.siup;
    data['akte'] = this.akte;
    data['bank_id'] = this.bankId;
    data['bank_name'] = this.bankName;
    data['akun_bank'] = this.akunBank;
    data['no_rekening'] = this.noRekening;
    data['row_status'] = this.rowStatus;
    data['foto'] = this.foto;
    data['kuota'] = this.kuota;
    data['kouta_terisi'] = this.koutaTerisi;
    data['jarak_pabrik'] = this.jarakPabrik;
    data['jam_buka'] = this.jamBuka;
    data['jam_tutup'] = this.jamTutup;
    data['periode_pemeliharaan'] = this.periodePemeliharaan;
    data['mulai_operasi'] = this.mulaiOperasi;
    data['harga'] = this.harga;
    return data;
  }
}
