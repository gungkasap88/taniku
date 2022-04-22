import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/response_kelurahan.dart';

import '../model/response_kecamatan.dart';
import '../model/response_kota.dart';
import '../model/response_provinsi.dart';
import '../viewmodel/tambahkebun_viewmodel.dart';
import 'homePage.dart';

class TambahKebun extends StatefulWidget {
  const TambahKebun({Key? key}) : super(key: key);

  @override
  State<TambahKebun> createState() => _TambahKebunState();
}

class _TambahKebunState extends State<TambahKebun> {

  TextEditingController kodeposController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kelurahanController = TextEditingController();

  var _provinsi;
  var _kota;
  var _kecamatan;
  var _kelurahan;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TambahKebunViewModel>(
      create: (context) => TambahKebunViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<TambahKebunViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --------------------- Alamat -----------------------
                          Row(
                              children: [
                                Text("Alamat"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          SizedBox(height: 10,),
                          TextFormField(
                              maxLines: 4,
                              controller: alamatController,
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                hintText: "deskripsi",
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

                          // --------------------- Rt dan Rw -----------------------
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("RT"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: rtController,
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
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("RW"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: rwController,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 10,),

                          // --------------------- Provinsi -----------------------
                          Row(
                              children: [
                                Text("Provinsi"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          SizedBox(height: 10,),
                            // DropdownSearch<String>(
                            //   mode: Mode.DIALOG,
                            //   showSearchBox: true,
                            //   onChanged: (value) => print(value?.toString()),
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
                              value: _provinsi,
                              items: viewModel.getProvinsi.map((DataProvinsi provinsi) {
                                return DropdownMenuItem(
                                  value: provinsi.provinsiId.toString(),
                                  child: Text(provinsi.provinsiName.toString()),
                                );
                              }).toList(),
                              onChanged: (newValueProvinsi) {
                                setState(() {
                                  print('Provinsi = >' +newValueProvinsi.toString());
                                  _provinsi = newValueProvinsi.toString();
                                  _kota = null;
                                  _kecamatan  = null;
                                  _kelurahan = null;
                                  kodeposController.clear();


                                });
                                viewModel.getDetailKota(newValueProvinsi.toString());
                              },
                            ),
                          SizedBox(height: 10,),

                          // --------------------- Kota -----------------------
                          Row(
                              children: [
                                Text("Kabupaten/Kota"),
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
                                value: _kota,
                                items: viewModel.getKota.map((DataKota kabupaten) {
                                  return DropdownMenuItem(
                                    value: kabupaten.kabupatenKotaId.toString(),
                                    child: Text(kabupaten.kabupatenKotaName.toString()),
                                  );
                                }).toList(),
                                onChanged: (newValueKabupaten) {
                                  setState(() {
                                    print('Kabupaten = >' +newValueKabupaten.toString());
                                    _kota = newValueKabupaten.toString();
                                    _kecamatan  = null;
                                    _kelurahan = null;
                                  });
                                  viewModel.getDetailKecamatan(newValueKabupaten.toString());
                                }
                            ),
                          SizedBox(height: 10,),

                          // --------------------- Kecamatan -----------------------
                          Row(
                              children: [
                                Text("Kecamatan"),
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
                              value: _kecamatan,
                              items: viewModel.getKecamatan.map((DataKecamatan kecamatan) {
                                return DropdownMenuItem(
                                  value: kecamatan.kecamatanId.toString(),
                                  child: Text(kecamatan.kecamatanName.toString()),
                                );
                              }).toList(),
                              onChanged: (newValueKecamatan) {
                                setState(() {
                                  print('Kecamatan = >' +newValueKecamatan.toString());
                                  _kecamatan  = newValueKecamatan.toString();
                                  _kelurahan = null;
                                });
                                viewModel.getDetailKelurahan(newValueKecamatan.toString());
                              },
                            ),
                          SizedBox(height: 10,),

                          // --------------------- Kelurahan -----------------------
                          Row(
                              children: [
                                Text("Kelurahan"),
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
                              value: _kelurahan,
                              items: viewModel.getKelurahan.map((DataKelurahan valueKelurahan){
                                return DropdownMenuItem(
                                  onTap: () => kodeposController.text = valueKelurahan.kodePos.toString(),
                                  value: valueKelurahan.kelurahanDesaId.toString(),
                                  child: Text(valueKelurahan.kelurahanDesaName.toString()),
                                );
                              }).toList(),
                              onChanged: (newValueKelurahan) {
                                setState(() {
                                  print('kelurahan => ' + newValueKelurahan.toString());
                                  _kelurahan = newValueKelurahan.toString();
                                });
                              },
                            ),
                          SizedBox(height: 10,),

                          // --------------------- Kode Pos -----------------------
                          Row(
                              children: [
                                Text("Kode Pos"),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          SizedBox(height: 10,),
                          TextFormField(
                              controller: kodeposController,
                              onTap: (){
                                kodeposController.clear();
                              },
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                //hintText: _kodeposController.text,
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
                          SizedBox(height: 25,),

                          // --------------------- Button -----------------------
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
                                    // print('Alamat = ' + alamatController.toString());
                                    // print('Rt/Rw = ' +
                                    //     rtController.toString() + "/" + rwController.toString());
                                    print('Provinsi id = ' + _provinsi.toString());
                                    print('Kabupaten id = ' + _kota.toString());
                                    print('Kecamatan id = ' + _kecamatan.toString());
                                    print('Kelurahan id = ' + _kelurahan.toString());
                                    print('Kode Pos = ' + kodeposController.text.toString());
                                  },
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
