import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_kecamatan.dart';
import 'package:taniku/model/response_kelurahan.dart';
import 'package:taniku/model/response_kota.dart';
import 'package:taniku/model/response_provinsi.dart';

import '../local/shared_pref_service.dart';

class TambahKebunApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponseProvinsi> getProvinsi(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/provinsi").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    Map<String, String> headersToken(tokenLokal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLokal'
      };
    }

    var _body = jsonEncode({
    });

    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseProvinsi.fromJson(jsonDecode(response.body));
      } else{
        return ResponseProvinsi.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseProvinsi.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future <ResponseKota> getKota(String provinsiId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kabupatenKota").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    Map<String, String> headersToken(tokenLokal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLokal'
      };
    }

    var _body = jsonEncode({
      'provinsi_id' : provinsiId
    });

    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseKota.fromJson(jsonDecode(response.body));
      } else{
        return ResponseKota.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseKota.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future <ResponseKecamatan> getKecamatan(String kotaId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kecamatan").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    Map<String, String> headersToken(tokenLokal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLokal'
      };
    }

    var _body = jsonEncode({
      'kabupaten_kota_id' : kotaId
    });

    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseKecamatan.fromJson(jsonDecode(response.body));
      } else{
        return ResponseKecamatan.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseKecamatan.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future <ResponseKelurahan> getKelurahan(String kecamatanId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kelurahanDesa").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    Map<String, String> headersToken(tokenLokal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLokal'
      };
    }

    var _body = jsonEncode({
      'kecamatan_id' : kecamatanId
    });

    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseKelurahan.fromJson(jsonDecode(response.body));
      } else{
        return ResponseKelurahan.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseKelurahan.withError("waktu habis, silahkan coba kembali");
    }
  }
}