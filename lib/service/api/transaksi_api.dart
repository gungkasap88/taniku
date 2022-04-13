import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_transaksi.dart';

class TransaksiApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponseTransaksi> getDataTransaksi(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/pabrik/getPabrik").replace();
    var token = 'N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw==';
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'jarak_maksimum': "1000000000000",
      'jarak_minimum' : "0",
      'latitude' : "20.149",
      'longitude' : "77.49",
      'orderBy' : "jarak_pabrik",
      'sort' : "desc",
      'user_id' : "85"

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseTransaksi.fromJson(jsonDecode(response.body));
      } else{
        return ResponseTransaksi.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseTransaksi.withError("waktu habis, silahkan coba kembali");
    }
  }}