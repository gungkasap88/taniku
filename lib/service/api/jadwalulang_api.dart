import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_jadwal_ulang.dart';
import 'package:taniku/model/response_pengiriman.dart';
import 'package:taniku/service/api/token.dart';

import '../local/shared_pref_service.dart';

class JadwalUlangApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";


}