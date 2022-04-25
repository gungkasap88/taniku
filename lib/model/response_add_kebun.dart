class AddKebunModel {
  String? userId;
  String? petaniId;
  String? latitude;
  String? longitude;
  String? alamat;
  String? rt;
  String? rw;
  String? provinsiId;
  String? kabupatenKotaId;
  String? kecamatanId;
  String? kelurahanId;
  String? kodePos;
  String? luasKebun;
  String? potensiProduksi;
  String? tahunTanamId;
  String? jenisBibitId;
  String? jumlahPohon;
  String? statusLahanId;
  List<ListDokumen>? listDokumen;
  List<ListSertifikasi>? listSertifikasi;

  AddKebunModel(
      {this.userId,
        this.petaniId,
        this.latitude,
        this.longitude,
        this.alamat,
        this.rt,
        this.rw,
        this.provinsiId,
        this.kabupatenKotaId,
        this.kecamatanId,
        this.kelurahanId,
        this.kodePos,
        this.luasKebun,
        this.potensiProduksi,
        this.tahunTanamId,
        this.jenisBibitId,
        this.jumlahPohon,
        this.statusLahanId,
        this.listDokumen,
        this.listSertifikasi});

  AddKebunModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    petaniId = json['petani_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    alamat = json['alamat'];
    rt = json['rt'];
    rw = json['rw'];
    provinsiId = json['provinsi_id'];
    kabupatenKotaId = json['kabupaten_kota_id'];
    kecamatanId = json['kecamatan_id'];
    kelurahanId = json['kelurahan_id'];
    kodePos = json['kode_pos'];
    luasKebun = json['luas_kebun'];
    potensiProduksi = json['potensi_produksi'];
    tahunTanamId = json['tahun_tanam_id'];
    jenisBibitId = json['jenis_bibit_id'];
    jumlahPohon = json['jumlah_pohon'];
    statusLahanId = json['status_lahan_id'];
    if (json['list_dokumen'] != null) {
      listDokumen = <ListDokumen>[];
      json['list_dokumen'].forEach((v) {
        listDokumen!.add(new ListDokumen.fromJson(v));
      });
    }
    if (json['list_sertifikasi'] != null) {
      listSertifikasi = <ListSertifikasi>[];
      json['list_sertifikasi'].forEach((v) {
        listSertifikasi!.add(new ListSertifikasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['petani_id'] = this.petaniId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['alamat'] = this.alamat;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['provinsi_id'] = this.provinsiId;
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['kecamatan_id'] = this.kecamatanId;
    data['kelurahan_id'] = this.kelurahanId;
    data['kode_pos'] = this.kodePos;
    data['luas_kebun'] = this.luasKebun;
    data['potensi_produksi'] = this.potensiProduksi;
    data['tahun_tanam_id'] = this.tahunTanamId;
    data['jenis_bibit_id'] = this.jenisBibitId;
    data['jumlah_pohon'] = this.jumlahPohon;
    data['status_lahan_id'] = this.statusLahanId;
    if (this.listDokumen != null) {
      data['list_dokumen'] = this.listDokumen!.map((v) => v.toJson()).toList();
    }
    if (this.listSertifikasi != null) {
      data['list_sertifikasi'] =
          this.listSertifikasi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDokumen {
  String? dokumenId;
  String? nomor;
  String? foto;

  ListDokumen({this.dokumenId, this.nomor, this.foto});

  ListDokumen.fromJson(Map<String, dynamic> json) {
    dokumenId = json['dokumen_id'];
    nomor = json['nomor'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dokumen_id'] = this.dokumenId;
    data['nomor'] = this.nomor;
    data['foto'] = this.foto;
    return data;
  }
}

class ListSertifikasi {
  String? sertifikasiId;
  String? sertifikasiNo;
  String? sertifikasiDari;
  String? sertifikasiSampai;
  String? sertifikasiImage;

  ListSertifikasi(
      {this.sertifikasiId,
        this.sertifikasiNo,
        this.sertifikasiDari,
        this.sertifikasiSampai,
        this.sertifikasiImage});

  ListSertifikasi.fromJson(Map<String, dynamic> json) {
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiNo = json['sertifikasi_no'];
    sertifikasiDari = json['sertifikasi_dari'];
    sertifikasiSampai = json['sertifikasi_sampai'];
    sertifikasiImage = json['sertifikasi_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_no'] = this.sertifikasiNo;
    data['sertifikasi_dari'] = this.sertifikasiDari;
    data['sertifikasi_sampai'] = this.sertifikasiSampai;
    data['sertifikasi_image'] = this.sertifikasiImage;
    return data;
  }
}