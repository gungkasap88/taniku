import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_pengiriman.dart';
import 'package:taniku/service/api/token.dart';

import '../../model/response_jadwal_ulang.dart';
import '../local/shared_pref_service.dart';

class PengirimanApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponsePengiriman> getDataPengiriman(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/getAll").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    final userId = await shared_pref_service().getStringSharedPref("user_id");
    Map<String, String> headersToken(tokenLocal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLocal'
      };
    }
    var _body = jsonEncode({
      'page': "1",
      'sort': "desc",
      'status': "",
      'type_user': "PTN",
      'user_id': userId

    });
    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponsePengiriman.fromJson(jsonDecode(response.body));
      } else{
        return ResponsePengiriman.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponsePengiriman.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future <ResponseJadwalUlang> getDataJadwalUlang(
      String tanggalKirim, String noRev) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/edit").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    final petaniId = await shared_pref_service().getStringSharedPref("petani_id");
    final userId = await shared_pref_service().getStringSharedPref("user_id");
    Map<String, String> headersToken(tokenLocal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLocal'
      };
    }
    var _body = jsonEncode({
      'no_reservasi': noRev,
      'petani_id': petaniId,
      'status':"1",
      'tanggal_pengiriman': tanggalKirim,
      'type_user':"PTN",
      'user_id':userId

    });
    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseJadwalUlang.fromJson(jsonDecode(response.body));
      } else{
        return ResponseJadwalUlang.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseJadwalUlang.withError("waktu habis, silahkan coba kembali");
    }
  }

}