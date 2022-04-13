import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/response_kebun_sertifikat.dart';

class DokumenApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <KebunSertifikat> getDetailDokumen(String kebunId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getKebunSertifikat").replace();
    var token = 'N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw==';
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'user_id' : "85",
      'kebun_id' : kebunId,
      'orderBy' : "id",
      'sort' : "asc"

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KebunSertifikat.fromJson(jsonDecode(response.body));
      } else{
        return KebunSertifikat.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return KebunSertifikat.withError("waktu habis, silahkan coba kembali");
    }
  }}