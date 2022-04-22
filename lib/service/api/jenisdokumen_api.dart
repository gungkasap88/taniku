import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_dokumen.dart';

class JenisDokumenApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<ResponseDokumen> getDokumen(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listJenisDokumen").replace();
    try{
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return ResponseDokumen.fromJson(jsonDecode(response.body));
      } else {
        return ResponseDokumen.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ResponseDokumen.withError("Waktu Habis, Silahkan coba kembali");
    }
  }
}