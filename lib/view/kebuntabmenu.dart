import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../model/response_tipe_lahan.dart';
import '../viewmodel/addkebun_viewmodel.dart';

class KebunTabMenu extends StatefulWidget {
  final AddKebunViewModel parentViewModel;

  const KebunTabMenu({Key? key, required this.parentViewModel}) : super(key: key);

  @override
  State<KebunTabMenu> createState() => _KebunTabMenuState();
}

class _KebunTabMenuState extends State<KebunTabMenu> {
  TextEditingController luaskebunC = TextEditingController();
  TextEditingController tipelahanC = TextEditingController();
  TextEditingController jumlahpohonC = TextEditingController();
  TextEditingController jenisbibitC = TextEditingController();
  TextEditingController tahuntanamC = TextEditingController();
  TextEditingController produksiC = TextEditingController();

  var _tipe;

  File? image;

  //note: ini dari API Dropdown Tipe Lahan
  List<DataTipe> dataTipeLahan = [];
  final String apiUrlH = "http://34.126.79.39:81/api/niaga/listStatusLahan";

  Future<ResponseTipeLahan> getTipeLahan(BuildContext context) async {
    var uri = Uri.parse(apiUrlH).replace();
    try{
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return ResponseTipeLahan.fromJson(jsonDecode(response.body));
      } else {
        return ResponseTipeLahan.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ResponseTipeLahan.withError("Waktu Habis, Silahkan coba kembali");
    }
  }

  void getDataTipeLahan(BuildContext context) async {
    final response = await getTipeLahan(context);
    if (response.error == null) {
      setState(() {
        dataTipeLahan = response.data!;
      });
    } else {
      print(response.error.toString());
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

  @override
  void initState() {
    getDataTipeLahan(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            // --------------------------------- Luas Kebun ----------------------------------------
                            Row(
                              children: [
                                Text("Luas Kebun"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: luaskebunC,
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                hintText: "",
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
                            SizedBox(height: 10,),

                            // --------------------------------- Tipe Lahan ----------------------------------------
                            Row(
                              children: [
                                Text("Tipe Lahan"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // DropdownButtonFormField(
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.black
                            //   ),
                            //   decoration: new InputDecoration(
                            //     contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            //     border: OutlineInputBorder(
                            //       borderSide: new BorderSide(color: Colors.black),
                            //       borderRadius: new BorderRadius.circular(25),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: new BorderSide(color: Colors.black),
                            //       borderRadius: new BorderRadius.circular(25.7),
                            //     ),
                            //   ),
                            //   isExpanded: true,
                            //   value: dropdownTipe,
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownTipe = newValue!;
                            //     });
                            //   },
                            //   items: <String>["Lahan Sendiri", "Sendiri", "Lahari", "Sendi"]
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),

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
                              value: _tipe,
                              items: dataTipeLahan.map((DataTipe tipeLahan) {
                                return DropdownMenuItem(
                                  value: tipeLahan.statusLahanId.toString(),
                                  child: Text(tipeLahan.statusLahanName.toString()),
                                );
                              }).toList(),
                              onChanged: (newtipeLahan) {
                                setState(() {
                                  print('Tipe Lahan = >' +newtipeLahan.toString());
                                  _tipe = newtipeLahan.toString();
                                });
                              },
                            ),
                            SizedBox(height: 10,),

                            // --------------------------------- Jumlah Pohon ----------------------------------------
                            Row(
                              children: [
                                Text("Jumlah Pohon"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: jumlahpohonC,
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                hintText: "",
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
                        )
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: Column(
                          children: [
                            // --------------------------------- Jenis Bibit ----------------------------------------
                            Row(
                              children: [
                                Text("Jenis Bibit"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // DropdownButtonFormField(
                            //   decoration: new InputDecoration(
                            //     contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            //     border: OutlineInputBorder(
                            //       borderSide: new BorderSide(color: Colors.black),
                            //       borderRadius: new BorderRadius.circular(25),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: new BorderSide(color: Colors.black),
                            //       borderRadius: new BorderRadius.circular(25.7),
                            //     ),
                            //   ),
                            //   isExpanded: true,
                            //   value: dropdownJenis,
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownJenis = newValue!;
                            //     });
                            //   },
                            //   items: <String>["Lonsum", "Nosul", "Sulom", "Mosul"]
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),

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
                              value: _tipe,
                              items: dataTipeLahan.map((DataTipe provinsi) {
                                return DropdownMenuItem(
                                  value: provinsi.statusLahanId.toString(),
                                  child: Text(provinsi.statusLahanName.toString()),
                                );
                              }).toList(),
                              onChanged: (newValueProvinsi) {
                                setState(() {
                                  print('Provinsi = >' +newValueProvinsi.toString());
                                  _tipe = newValueProvinsi.toString();
                                  //_tipe = null;


                                });
                                //viewModel.getDetailTipe(newValueProvinsi.toString());
                              },
                            ),
                            SizedBox(height: 10,),

                            // --------------------------------- Tahun Tanam ----------------------------------------
                            Row(
                              children: [
                                Text("Tahun Tanam"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: luaskebunC,
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                hintText: "",
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
                            SizedBox(height: 10,),

                            // --------------------------------- Produksi per Bulan ----------------------------------------
                            Row(
                              children: [
                                Text("Prduksi per Bulan"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: produksiC,
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                hintText: "",
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
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                // --------------------------------- Foto Kebun ----------------------------------------
                Row(
                  children: [
                    Text("Foto Kebun"),
                    Text(" *", style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      image != null ? Image.file(image!, width: 100, height: 100,):
                      Icon(Icons.image_outlined, size: 125,),
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
                SizedBox(height: 60,),
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
                      onPressed:() {
                        // widget.parentViewModel.addKebunModel.alamat=alamatController.text;
                        // widget.parentViewModel.addKebunModel.rt=rtController.text;
                        // widget.parentViewModel.addKebunModel.rw=rwController.text;
                        // widget.parentViewModel.addKebunModel.provinsiId=_provinsi.text;
                        // widget.parentViewModel.addKebunModel.kabupatenKotaId=_kota.text;
                        // widget.parentViewModel.addKebunModel.kecamatanId=_kecamatan.text;
                        // widget.parentViewModel.addKebunModel.kelurahanId=_kelurahan.text;
                        // widget.parentViewModel.addKebunModel.kodePos=kodeposController.text;
                      },
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
