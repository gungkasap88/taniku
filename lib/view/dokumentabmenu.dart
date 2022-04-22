import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/dokumen_viewmodel.dart';

import '../model/response_dokumen.dart';
import 'db.dart';

class DokumenTabMenu extends StatefulWidget {
  const DokumenTabMenu({Key? key}) : super(key: key);

  @override
  State<DokumenTabMenu> createState() => _DokumenTabMenuState();
}

class _DokumenTabMenuState extends State<DokumenTabMenu> {

  TextEditingController nomor = TextEditingController();
  var _dokumen;

  File? image;

  // ---------------------- Pemanggilan Database -----------------------------
  // List<Map> listData = [];
  // MyDb mydb = MyDb();
  //
  // void getData(){
  //   Future.delayed(const Duration(milliseconds: 500),() async {
  //     listData = await mydb.db.rawQuery('SELECT * FROM users');
  //     setState(() { });
  //   });
  // }

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DokumenViewModel>(
      create: (context) => DokumenViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<DokumenViewModel>(
            builder: (context, viewmodel, child) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Form(
                      child: Column(
                        children: [
                          Center(
                            child: ElevatedButton(
                              child: Text("Tambah Dokumen Kepemilikan", style: TextStyle(color: Colors.deepOrange, fontSize: 18)),
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
                                                    value: _dokumen,
                                                    items: viewmodel.dataDokumen.map((DataDokumen tipeDokumen) {
                                                      return DropdownMenuItem(
                                                        value: tipeDokumen.dokumenJenis.toString(),
                                                        child: Text(tipeDokumen.dokumenJenis.toString()),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newtipeDokumen) {
                                                      setState(() {
                                                        print('Tipe Dokumen = >' +newtipeDokumen.toString());
                                                        _dokumen = newtipeDokumen.toString();
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(height: 25),
                                                  Text("Nomor Dokumen"),
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
                                                    viewmodel.addDokumen(_dokumen, nomor.text, context);
                                                    _dokumen = "";
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
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: viewmodel.listdokumen.isEmpty ? const Text("Tidak Ada Data Dokumen") :
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewmodel.listdokumen.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                      child: ListTile(
                                        leading: const Icon(Icons.people),
                                        title: Text(viewmodel.listdokumen[index].dokumen.toString()),
                                        subtitle: Text("Nomor :" + viewmodel.listdokumen[index].nodokumen.toString()),
                                        trailing: Wrap(children: [
                                          IconButton(onPressed: () async {
                                            showDialog(context: context, builder: (_) {
                                              var data = viewmodel.getDokumenById(int.parse(viewmodel.listdokumen[index].id.toString()), context);
                                              var iddokumen;
                                              var nomordokumen;
                                              //if (data != null){
                                                iddokumen = viewmodel.dataDok.dokumen.toString();
                                                nomordokumen = viewmodel.dataDok.nodokumen.toString();
                                              //} else {

                                              //}
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
                                                  child: Text("Tambah Sertifikat",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18
                                                    ),
                                                  ),
                                                ),
                                                content: Container(
                                                  width: 500,
                                                  height: 700,
                                                  child: Form(
                                                    child: SingleChildScrollView(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text("Tipe Dokumen"),
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
                                                              hint: Text("$iddokumen"),
                                                              value: _dokumen,
                                                              items: viewmodel.dataDokumen.map((DataDokumen dokumen) {
                                                                return DropdownMenuItem(
                                                                  value: dokumen.dokumenName.toString(),
                                                                  child: Text(dokumen.dokumenName.toString()),
                                                                );
                                                              }).toList(),
                                                              onChanged: (newSertifikasi) {
                                                                setState(() {
                                                                  print('Tipe Dokumen = >' +newSertifikasi.toString());
                                                                  _dokumen = newSertifikasi.toString();
                                                                });
                                                              },
                                                            ),
                                                            SizedBox(height: 20,),
                                                            Row(
                                                              children: [
                                                                Text("Nomor Dokumen"),
                                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                              ],
                                                            ),
                                                            SizedBox(height: 10,),
                                                            TextFormField(
                                                              controller: nomor,
                                                              decoration: new InputDecoration(
                                                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                                                hintText: nomordokumen,
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
                                                              viewmodel.editDokumen(viewmodel.listdokumen[index].id ?? 0, _dokumen, nomor.text, context);
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
                                            viewmodel.deletedDokumen(viewmodel.listdokumen[index].id ?? 0, context);
                                          }, icon: const Icon(Icons.delete, color:Colors.red))

                                        ],
                                        ),
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
