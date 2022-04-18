class ResponseProfile {
  bool? isSuccess;
  String? message;
  Data2? data;
  String? error;

  ResponseProfile({
    this.isSuccess,
    this.message,
    this.data,
    this.error
  });

  ResponseProfile.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new Data2.fromJson(json['data']) : null;
  }

  factory ResponseProfile.withError(String error) => ResponseProfile(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data2 {
  String? nama;
  Null? foto;
  String? mobile;
  Null? email;
  String? typeUser;
  Null? bankName;
  Null? provinsiName;
  Null? kecamatanName;
  Null? kabupatenKotaName;
  Null? kelurahanDesaName;
  int? id;
  int? userId;
  Null? noKtp;
  Null? fotoKtp;
  Null? noKk;
  Null? fotoKk;
  Null? npwp;
  Null? fotoNpwp;
  Null? bpjsTk;
  Null fotoBpjsTk;
  Null bpjsKes;
  Null? fotoBpjsKes;
  int? bankId;
  String? akunBank;
  String? noRekening;
  Null? latitude;
  Null? longitude;
  Null? alamat;
  Null? rt;
  Null? rw;
  Null? provinsiId;
  Null? kabupatenKotaId;
  Null? kecamatanId;
  Null? kelurahanId;
  Null? kodePos;
  Null? ktpLatitude;
  Null? ktpLongitude;
  Null? ktpAlamat;
  Null? ktpRt;
  Null? ktpRw;
  Null? ktpProvinsiId;
  Null? ktpKabupatenKotaId;
  Null? ktpKecamatanId;
  Null? ktpKelurahanId;
  Null? ktpKodePos;
  Null? jenisKelamin;
  Null? tempatLahir;
  Null? tanggalLahir;
  Null? agamaId;
  Null? statusNikahId;
  Null? pendidikanId;
  Null? pekerjaanId;
  Null? industriId;
  Null? onlineWorkId;
  Null? gaji;
  Null? periodePengalamanId;
  Null? totalAset;
  Null? homeOwnershipId;
  String? rowStatus;
  int? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;
  Null? systemTime;

  Data2(
      {this.nama,
        this.foto,
        this.mobile,
        this.email,
        this.typeUser,
        this.bankName,
        this.provinsiName,
        this.kecamatanName,
        this.kabupatenKotaName,
        this.kelurahanDesaName,
        this.id,
        this.userId,
        this.noKtp,
        this.fotoKtp,
        this.noKk,
        this.fotoKk,
        this.npwp,
        this.fotoNpwp,
        this.bpjsTk,
        this.fotoBpjsTk,
        this.bpjsKes,
        this.fotoBpjsKes,
        this.bankId,
        this.akunBank,
        this.noRekening,
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
        this.ktpLatitude,
        this.ktpLongitude,
        this.ktpAlamat,
        this.ktpRt,
        this.ktpRw,
        this.ktpProvinsiId,
        this.ktpKabupatenKotaId,
        this.ktpKecamatanId,
        this.ktpKelurahanId,
        this.ktpKodePos,
        this.jenisKelamin,
        this.tempatLahir,
        this.tanggalLahir,
        this.agamaId,
        this.statusNikahId,
        this.pendidikanId,
        this.pekerjaanId,
        this.industriId,
        this.onlineWorkId,
        this.gaji,
        this.periodePengalamanId,
        this.totalAset,
        this.homeOwnershipId,
        this.rowStatus,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate,
        this.systemTime});

  Data2.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    foto = json['foto'];
    mobile = json['mobile'];
    email = json['email'];
    typeUser = json['type_user'];
    bankName = json['bank_name'];
    provinsiName = json['provinsi_name'];
    kecamatanName = json['kecamatan_name'];
    kabupatenKotaName = json['kabupaten_kota_name'];
    kelurahanDesaName = json['kelurahan_desa_name'];
    id = json['id'];
    userId = json['user_id'];
    noKtp = json['no_ktp'];
    fotoKtp = json['foto_ktp'];
    noKk = json['no_kk'];
    fotoKk = json['foto_kk'];
    npwp = json['npwp'];
    fotoNpwp = json['foto_npwp'];
    bpjsTk = json['bpjs_tk'];
    fotoBpjsTk = json['foto_bpjs_tk'];
    bpjsKes = json['bpjs_kes'];
    fotoBpjsKes = json['foto_bpjs_kes'];
    bankId = json['bank_id'];
    akunBank = json['akun_bank'];
    noRekening = json['no_rekening'];
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
    ktpLatitude = json['ktp_latitude'];
    ktpLongitude = json['ktp_longitude'];
    ktpAlamat = json['ktp_alamat'];
    ktpRt = json['ktp_rt'];
    ktpRw = json['ktp_rw'];
    ktpProvinsiId = json['ktp_provinsi_id'];
    ktpKabupatenKotaId = json['ktp_kabupaten_kota_id'];
    ktpKecamatanId = json['ktp_kecamatan_id'];
    ktpKelurahanId = json['ktp_kelurahan_id'];
    ktpKodePos = json['ktp_kode_pos'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    agamaId = json['agama_id'];
    statusNikahId = json['status_nikah_id'];
    pendidikanId = json['pendidikan_id'];
    pekerjaanId = json['pekerjaan_id'];
    industriId = json['industri_id'];
    onlineWorkId = json['online_work_id'];
    gaji = json['gaji'];
    periodePengalamanId = json['periode_pengalaman_id'];
    totalAset = json['total_aset'];
    homeOwnershipId = json['home_ownership_id'];
    rowStatus = json['row_status'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    systemTime = json['system_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['foto'] = this.foto;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type_user'] = this.typeUser;
    data['bank_name'] = this.bankName;
    data['provinsi_name'] = this.provinsiName;
    data['kecamatan_name'] = this.kecamatanName;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    data['kelurahan_desa_name'] = this.kelurahanDesaName;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['no_ktp'] = this.noKtp;
    data['foto_ktp'] = this.fotoKtp;
    data['no_kk'] = this.noKk;
    data['foto_kk'] = this.fotoKk;
    data['npwp'] = this.npwp;
    data['foto_npwp'] = this.fotoNpwp;
    data['bpjs_tk'] = this.bpjsTk;
    data['foto_bpjs_tk'] = this.fotoBpjsTk;
    data['bpjs_kes'] = this.bpjsKes;
    data['foto_bpjs_kes'] = this.fotoBpjsKes;
    data['bank_id'] = this.bankId;
    data['akun_bank'] = this.akunBank;
    data['no_rekening'] = this.noRekening;
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
    data['ktp_latitude'] = this.ktpLatitude;
    data['ktp_longitude'] = this.ktpLongitude;
    data['ktp_alamat'] = this.ktpAlamat;
    data['ktp_rt'] = this.ktpRt;
    data['ktp_rw'] = this.ktpRw;
    data['ktp_provinsi_id'] = this.ktpProvinsiId;
    data['ktp_kabupaten_kota_id'] = this.ktpKabupatenKotaId;
    data['ktp_kecamatan_id'] = this.ktpKecamatanId;
    data['ktp_kelurahan_id'] = this.ktpKelurahanId;
    data['ktp_kode_pos'] = this.ktpKodePos;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['agama_id'] = this.agamaId;
    data['status_nikah_id'] = this.statusNikahId;
    data['pendidikan_id'] = this.pendidikanId;
    data['pekerjaan_id'] = this.pekerjaanId;
    data['industri_id'] = this.industriId;
    data['online_work_id'] = this.onlineWorkId;
    data['gaji'] = this.gaji;
    data['periode_pengalaman_id'] = this.periodePengalamanId;
    data['total_aset'] = this.totalAset;
    data['home_ownership_id'] = this.homeOwnershipId;
    data['row_status'] = this.rowStatus;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    data['system_time'] = this.systemTime;
    return data;
  }
}
