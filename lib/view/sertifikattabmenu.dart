import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/response_dokumen.dart';
import 'db.dart';

class SertifikatTabMenu extends StatefulWidget {
  const SertifikatTabMenu({Key? key}) : super(key: key);

  @override
  State<SertifikatTabMenu> createState() => _SertifikatTabMenuState();
}

class _SertifikatTabMenuState extends State<SertifikatTabMenu> {

  TextEditingController nomor = TextEditingController();

  var _sertifikasi;
  var dateC = TextEditingController();
  var timeC = TextEditingController();
  var dateTime;
  var tgl;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool showDate = false;
  bool showTime = false;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        tgl = DateFormat('yyyy-MM-dd').format(selectedDate);
        dateC.text = DateFormat.yMd().format(selectedDate);
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
        var hour = selectedTime.hour.toString();
        var minute = selectedTime.minute.toString();
        dateTime = " " + hour + ":" + minute + ":00 ";
        timeC.text = dateTime;
      });
    }
    return selectedTime;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  File? image;

  List<Map> listData = [];
  MyDb mydb = MyDb();

  void getData(){
    Future.delayed(const Duration(milliseconds: 500),() async {
      listData = await mydb.db.rawQuery('SELECT * FROM users');
      setState(() { });
    });
  }

  //note: ini dari API Dropdown Tipe Lahan
  List<DataDokumen> dataTipeDokumen = [];
  final String apiUrlH = "http://34.126.79.39:81/api/niaga/listJenisDokumen";

  Future<ResponseDokumen> getTipeLahan(BuildContext context) async {
    var uri = Uri.parse(apiUrlH).replace();
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

  void getDataTipeDokumen(BuildContext context) async {
    final response = await getTipeLahan(context);
    if (response.error == null) {
      setState(() {
        dataTipeDokumen = response.data!;
      });
    } else {
      print(response.error.toString());
    }
  }

  @override
  void initState() {
    mydb.open();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
              child: Center(
                child: ElevatedButton(
                  child: Text("Tambah Sertifikat", style: TextStyle(color: Colors.deepOrange, fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.white,
                    onSurface: Colors.grey,
                    side: BorderSide(color: Colors.orange, width: 2),
                    minimumSize: Size(350,60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed:() {
                    showDialog(context: context, builder: (_) =>
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                          ),
                          titlePadding: EdgeInsets.all(0.0),
                          title: Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)
                              ),
                            ),
                            child: Text("Tambah Dokumen Kepemelikan",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          content: Container(
                            width: 500,
                            height: 350,
                            child: Form(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Dokumen"),
                                      SizedBox(height: 10),
                                      DropdownButtonFormField(
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          border: OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.black),
                                            borderRadius: new BorderRadius.circular(25),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.black),
                                            borderRadius: new BorderRadius.circular(25.7),
                                          ),
                                        ),
                                        isExpanded: true,
                                        value: _sertifikasi,
                                        items: dataTipeDokumen.map((DataDokumen tipeDokumen) {
                                          return DropdownMenuItem(
                                            value: tipeDokumen.dokumenJenis.toString(),
                                            child: Text(tipeDokumen.dokumenJenis.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (newtipeDokumen) {
                                          setState(() {
                                            print('Tipe Dokumen = >' +newtipeDokumen.toString());
                                            _sertifikasi = newtipeDokumen.toString();
                                          });
                                        },
                                      ),
                                      SizedBox(height: 25),
                                      Text("Nomor Sertifikasi"),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        controller: nomor,
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          border: OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.black, width: 2),
                                            borderRadius: new BorderRadius.circular(25),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.black),
                                            borderRadius: new BorderRadius.circular(25.7),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Tanggal",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                SizedBox(height: 7,),
                                                TextField(
                                                  controller: dateC,
                                                  onTap: () {
                                                    _selectDate(context);
                                                    showDate = true;
                                                  },
                                                  style:
                                                  new TextStyle(fontSize: 16.0,),
                                                  decoration: new InputDecoration(
                                                    hintText: getDate(),
                                                    suffixIcon: Icon(Icons.calendar_today),
                                                    contentPadding: const EdgeInsets.all(10),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.black),
                                                      borderRadius: new BorderRadius.circular(25.7),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.black),
                                                      borderRadius: new BorderRadius.circular(25.7),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Waktu",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                TextField(
                                                  controller: timeC,
                                                  onTap: () {
                                                    _selectTime(context);
                                                    showTime = true;
                                                  },
                                                  style:
                                                  new TextStyle(fontSize: 16.0,),
                                                  decoration: new InputDecoration(
                                                    hintText: getTime(selectedTime),
                                                    suffixIcon: Icon(Icons.access_alarm_outlined),
                                                    contentPadding: const EdgeInsets.all(10),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.black),
                                                      borderRadius: new BorderRadius.circular(25.7),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.black),
                                                      borderRadius: new BorderRadius.circular(25.7),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 25),
                                      Text("Foto Dokumen"),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.image_outlined, size: 100,),
                                            //SizedBox(width: 50,),
                                            ElevatedButton(
                                              child: Text("Unggah", style: TextStyle(color: Colors.orange, fontSize: 18)),
                                              style: ElevatedButton.styleFrom(
                                                onPrimary: Colors.white,
                                                primary: Colors.white,
                                                onSurface: Colors.grey,
                                                minimumSize: Size(100,50),
                                                side: BorderSide(color: Colors.orange, width: 2),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                              ),
                                              onPressed:() {
                                                showDialog(context: context, builder: (_) => AlertDialog(
                                                  title: Text('Unggah'),
                                                  content: Container(
                                                    width: 500,
                                                    height: 120,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Divider(thickness: 2, color: Colors.red.shade100),
                                                        SizedBox(height: 10,),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Text("Ambil Gambar dari Galeri", style: TextStyle(color: Colors.black87, fontSize: 18),),
                                                        ),
                                                        SizedBox(height: 20,),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Text("Ambil Foto dari Kamera", style: TextStyle(color: Colors.black87, fontSize: 18),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {},
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      child: Text("Tidak, Ubah", style: TextStyle(color: Colors.orange)),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.white,
                                        onSurface: Colors.grey,
                                        side: BorderSide(color: Colors.orange, width: 2),
                                        minimumSize: Size(100,50),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                      ),
                                      onPressed:() {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(width: 10,),
                                    ElevatedButton(
                                      child: Text("Ya, Benar", style: TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.orange,
                                        onSurface: Colors.grey,
                                        minimumSize: Size(10,50),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      ),
                                      onPressed:() {
                                        Navigator.pop(context);
                                        mydb.db.rawInsert("INSERT INTO users (dokumen, nodokumen) VALUES (?, ?);",
                                            [_sertifikasi, nomor.text]);
                                        print(_sertifikasi);
                                        print(nomor.text);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("New User Added")));
                                        _sertifikasi = "";
                                        nomor.text = "";
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    );
                  },
                ),
              )
          ),
        ),
      ),
    );
  }
}
