//import 'dart:html';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/response_sertifikasi.dart';
import 'package:taniku/viewmodel/sertifikasi_viewmodel.dart';


class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({Key? key}) : super(key: key);

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {

  var _sertifikasi;
  final nomor = TextEditingController();
  var dateC = TextEditingController();
  var date2C = TextEditingController();
  var tgl;

  File? imageedit;
  File? image;

  DateTime selectedDate = DateTime.now();
  bool showDate = false;

  Future<void> _selectDate(BuildContext context) async {
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
  }

  Future<void> _selectDate2(BuildContext context) async {
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
        date2C.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageEdit() async {
    try {
      final imageEdit = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(imageEdit == null) return;

      final imageTempEdit = File(imageEdit.path);

      setState(() => this.imageedit = imageTempEdit);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCEdit() async {
    try {
      final imageEdit = await ImagePicker().pickImage(source: ImageSource.camera);

      if(imageEdit == null) return;

      final imageTempEdit = File(imageEdit.path);

      setState(() => this.imageedit = imageTempEdit);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SertifikasiViewModel>(
      create: (context) => SertifikasiViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<SertifikasiViewModel>(
              builder: (context, viewmodel, child) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Center(
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
                                                  topRight: Radius.circular(20.0),
                                                  topLeft: Radius.circular(20.0)
                                              ),
                                            ),
                                            child: Text("Tambah Sertifikat",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),
                                            ),
                                          ),
                                          content: Container(
                                            width: 500,
                                            height: 400,
                                            child: Form(
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // ------------------------------ Tambah Sertifikat -----------------------------------------
                                                      Row(
                                                        children: [
                                                          Text("Tipe Sertifikasi"),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
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
                                                        items: viewmodel.dataSertifikasi.map((DataSertifikasi sertifikasi) {
                                                          return DropdownMenuItem(
                                                            value: sertifikasi.sertifikasiName.toString(),
                                                            child: Text(sertifikasi.sertifikasiName.toString()),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newSertifikasi) {
                                                          setState(() {
                                                            print('Tipe Dokumen = >' +newSertifikasi.toString());
                                                            _sertifikasi = newSertifikasi.toString();
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Text("Nomor Sertifikasi"),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
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
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Text("Masa Berlaku"),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Dari Tanggal"),
                                                                SizedBox(height: 7,),
                                                                TextField(
                                                                  controller: dateC,
                                                                  onTap: () {
                                                                    _selectDate(context);
                                                                    showDate = true;
                                                                  },
                                                                  decoration: new InputDecoration(
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
                                                                Text("Sampai Tanggal"),
                                                                SizedBox(height: 7,),
                                                                TextField(
                                                                  controller: date2C,
                                                                  onTap: () {
                                                                    _selectDate2(context);
                                                                    showDate = true;
                                                                  },
                                                                  decoration: new InputDecoration(
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
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Text("Unggah Sertifikat"),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            image != null ? Image.file(image!, width: 50, height: 50,):
                                                            Icon(Icons.image_outlined, size: 50,),
                                                            //Icon(Icons.image_outlined, size: 125,),
                                                            SizedBox(width: 50,),
                                                            ElevatedButton(
                                                              child: Text("Unggah", style: TextStyle(color: Colors.orange, fontSize: 18)),
                                                              style: ElevatedButton.styleFrom(
                                                                onPrimary: Colors.white,
                                                                primary: Colors.white,
                                                                onSurface: Colors.grey,
                                                                minimumSize: Size(100,60),
                                                                side: BorderSide(color: Colors.orange, width: 2),
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                                              ),
                                                              onPressed:() {
                                                                showDialog(context: context, builder: (_) => AlertDialog(
                                                                  title: Text('Pilih Aksi'),
                                                                  content: Container(
                                                                    width: 500,
                                                                    height: 120,
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Divider(thickness: 2, color: Colors.red.shade100),
                                                                        SizedBox(height: 10,),
                                                                        InkWell(
                                                                          onTap: () {
                                                                            pickImage();
                                                                          },
                                                                          child: Text("Ambil Gambar dari Galeri", style: TextStyle(color: Colors.black87, fontSize: 18),),
                                                                        ),
                                                                        SizedBox(height: 20,),
                                                                        InkWell(
                                                                          onTap: () {
                                                                            pickImageC();
                                                                          },
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
                                                      onPressed:() async {
                                                        Navigator.pop(context);
                                                        Uint8List foto = await image!.readAsBytes();
                                                        var _tanggal = dateC.text + date2C.text;
                                                        viewmodel.addUser(_sertifikasi, nomor.text, _tanggal, foto,  context);
                                                        //_sertifikasi = "";
                                                        //nomor.text = "";
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
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: viewmodel.listuser.isEmpty ? const Text("No Data") :
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: viewmodel.listuser.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                          child: ListTile(
                                            leading: const Icon(Icons.people),
                                            title: Text(viewmodel.listuser[index].sertifikat.toString()),
                                            subtitle: Text("Nomor :" + viewmodel.listuser[index].nosertifikat.toString()),
                                            trailing: Wrap(children: [

                                              // -------------------------------------- Ubah Sertifikasi -------------------------------------
                                              IconButton(onPressed: () async {
                                                // --------------------------------- Untuk data null -----------------------------------
                                                await viewmodel.getUserById(int.parse(viewmodel.listuser[index].id.toString()), context);
                                                var sertifikasi = viewmodel.dataSer.sertifikat.toString();
                                                var nomorsertifikasi = viewmodel.dataSer.nosertifikat.toString();
                                                var daritanggal = viewmodel.dataSer.tanggal.toString().substring(0,10);
                                                var sampaitanggal = viewmodel.dataSer.tanggal.toString().substring(0,10);
                                                // --------------------------------- Untuk data null -----------------------------------
                                                showDialog(context: context, builder: (_) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                                    ),
                                                    titlePadding: EdgeInsets.all(0.0),
                                                    title: Container(
                                                      padding: EdgeInsets.all(20.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(20.0),
                                                            topLeft: Radius.circular(20.0)
                                                        ),
                                                      ),
                                                      child: Text("Ubah Sertifikat",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18
                                                        ),
                                                      ),
                                                    ),
                                                    content: Container(
                                                      width: 500,
                                                      height: 400,
                                                      child: Form(
                                                        child: SingleChildScrollView(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text("Tipe Sertifikasi"),
                                                                    Text(" *", style: TextStyle(color: Colors.red),),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10,),
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
                                                                  hint: Text("$sertifikasi"),
                                                                  value: _sertifikasi,
                                                                  items: viewmodel.dataSertifikasi.map((DataSertifikasi sertifikasi) {
                                                                    return DropdownMenuItem(
                                                                      value: sertifikasi.sertifikasiName.toString(),
                                                                      child: Text(sertifikasi.sertifikasiName.toString()),
                                                                    );
                                                                  }).toList(),
                                                                  onChanged: (newSertifikasi) {
                                                                    setState(() {
                                                                      print('Tipe Dokumen = >' +newSertifikasi.toString());
                                                                      _sertifikasi = newSertifikasi.toString();
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(height: 20,),
                                                                Row(
                                                                  children: [
                                                                    Text("Nomor Sertifikasi"),
                                                                    Text(" *", style: TextStyle(color: Colors.red),),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10,),
                                                                TextFormField(
                                                                  controller: nomor,
                                                                  decoration: new InputDecoration(
                                                                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                                                    hintText: nomorsertifikasi,
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
                                                                SizedBox(height: 20,),
                                                                Row(
                                                                  children: [
                                                                    Text("Masa Berlaku"),
                                                                    Text(" *", style: TextStyle(color: Colors.red),),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text("Dari Tanggal"),
                                                                          SizedBox(height: 7,),
                                                                          TextField(
                                                                            controller: dateC,
                                                                            onTap: () {
                                                                              _selectDate(context);
                                                                              showDate = true;
                                                                            },
                                                                            decoration: new InputDecoration(
                                                                              //hintText: getDate(),
                                                                              hintText: daritanggal,
                                                                              //hintStyle: TextStyle(fontSize: 10),
                                                                              //suffixIcon: Icon(Icons.calendar_today),
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
                                                                          Text("Sampai Tanggal"),
                                                                          SizedBox(height: 7,),
                                                                          TextField(
                                                                            controller: date2C,
                                                                            onTap: () {
                                                                              _selectDate2(context);
                                                                              showDate = true;
                                                                            },
                                                                            decoration: new InputDecoration(
                                                                              //hintText: getDate(),
                                                                              hintText: sampaitanggal,
                                                                              //hintStyle: TextStyle(fontSize: 8),
                                                                              //suffixIcon: Icon(Icons.calendar_today),
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
                                                                SizedBox(height: 20,),
                                                                Row(
                                                                  children: [
                                                                    Text("Unggah Sertifikat"),
                                                                    Text(" *", style: TextStyle(color: Colors.red),),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10,),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 10),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        width: 60,
                                                                        height: 80,
                                                                        child: imageedit != null ? Image.memory(viewmodel.listuser[index].foto!) :
                                                                        //Icon(Icons.image_outlined, size: 50,),
                                                                        Image.memory(viewmodel.listuser[index].foto!),
                                                                      ),
                                                                      //Icon(Icons.image_outlined, size: 125,),
                                                                      SizedBox(width: 50,),
                                                                      ElevatedButton(
                                                                        child: Text("Unggah", style: TextStyle(color: Colors.orange, fontSize: 18)),
                                                                        style: ElevatedButton.styleFrom(
                                                                          onPrimary: Colors.white,
                                                                          primary: Colors.white,
                                                                          onSurface: Colors.grey,
                                                                          minimumSize: Size(100,60),
                                                                          side: BorderSide(color: Colors.orange, width: 2),
                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                                                        ),
                                                                        onPressed:() {
                                                                          showDialog(context: context, builder: (_) => AlertDialog(
                                                                            title: Text('Pilih Aksi'),
                                                                            content: Container(
                                                                              width: 500,
                                                                              height: 120,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Divider(thickness: 2, color: Colors.red.shade100),
                                                                                  SizedBox(height: 10,),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      pickImage();
                                                                                    },
                                                                                    child: Text("Ambil Gambar dari Galeri", style: TextStyle(color: Colors.black87, fontSize: 18),),
                                                                                  ),
                                                                                  SizedBox(height: 20,),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      pickImageC();
                                                                                    },
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
                                                                child: Text("Ya, Ubah", style: TextStyle(color: Colors.white)),
                                                                style: ElevatedButton.styleFrom(
                                                                  onPrimary: Colors.white,
                                                                  primary: Colors.orange,
                                                                  onSurface: Colors.grey,
                                                                  minimumSize: Size(10,50),
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                                ),
                                                                onPressed:() async {
                                                                  Navigator.pop(context);
                                                                  Uint8List foto = await image!.readAsBytes();
                                                                  var _tanggal = dateC.text + date2C.text;
                                                                  viewmodel.editSertifikasi(viewmodel.listuser[index].id ?? 0,_sertifikasi, nomor.text, _tanggal, foto,  context);
                                                                  //_sertifikasi = "";
                                                                  //nomor.text = "";
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                }
                                                );
                                              },
                                                  icon: const Icon(Icons.edit)),

                                              IconButton(onPressed: () async {
                                                viewmodel.deleteUser(viewmodel.listuser[index].id ?? 0, context);
                                              }, icon: const Icon(Icons.delete, color:Colors.red))

                                            ],
                                            ),
                                          ));
                                    }),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    child: Text("Kembali", style: TextStyle(color: Colors.orange, fontSize: 18)),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.white,
                                      onSurface: Colors.grey,
                                      minimumSize: Size(150,60),
                                      side: BorderSide(color: Colors.orange, width: 2),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                    ),
                                    onPressed:() {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  ElevatedButton(
                                    child: Text("Selanjutnya", style: TextStyle(color: Colors.white, fontSize: 18)),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.orange,
                                      onSurface: Colors.grey,
                                      minimumSize: Size(150,60),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                    onPressed:() {},
                                  )
                                ],
                              ),
                            ],
                          ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
