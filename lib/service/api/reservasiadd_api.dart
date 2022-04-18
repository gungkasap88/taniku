import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_persediaan_stok.dart';
import 'package:taniku/service/api/token.dart';

import '../local/shared_pref_service.dart';

class PersediaanApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponsePersediaanStok> getDataPersediaan(
      String pabrikId, String tglKirim, String tonasi) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/add").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    final petaniId = await shared_pref_service().getStringSharedPref("petani_id");
    final userId = await shared_pref_service().getStringSharedPref("user_id");
    Map<String, String> headersToken(tokenLocal) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLocal'
      };
    }

    var _body = jsonEncode({
      'koperasi_id': "",
      'pabrik_id': "$pabrikId",
      'petani_id': petaniId,
      'tanggal_pengiriman': "$tglKirim",
      'tonasi': "$tonasi",
      'user_id': userId
    });

    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponsePersediaanStok.fromJson(jsonDecode(response.body));
      } else {
        return ResponsePersediaanStok.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponsePersediaanStok.withError("waktu habis, silahkan coba kembali");
    }
  }
}