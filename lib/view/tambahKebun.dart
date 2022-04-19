import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/pengirimanPage.dart';
import 'package:taniku/view/profil_screen.dart';
import 'package:taniku/view/transaksiPage.dart';

import '../viewmodel/tambahkebun_viewmodel.dart';
import 'homePage.dart';

class TambahKebun extends StatefulWidget {
  const TambahKebun({Key? key}) : super(key: key);

  @override
  State<TambahKebun> createState() => _TambahKebunState();
}

class _TambahKebunState extends State<TambahKebun> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;
  int _activeIndex = 0;

  TextEditingController _kodeposController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _rtController = TextEditingController();
  TextEditingController _rwController = TextEditingController();

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
                return DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.green,
                        title: Text("Tambah Kebun"),
                        bottom: PreferredSize(
                          preferredSize: Size(50,50),
                          child: Container(
                            color: Colors.white,
                            child: TabBar(
                              labelColor: Colors.black,
                              tabs: [
                                Tab(text: "Alamat"),
                                Tab(text: "Kebun"),
                                Tab(text: "Dokumen"),
                                Tab(text: "Sertifikasi"),
                              ],
                            ),
                          ),
                        )
                    ),
                    body: TabBarView(
                      children:[
                        Container(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Alamat"),
                                      Text(" *", style: TextStyle(color: Colors.red),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    maxLines: 4,
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
                                      onTap: (){
                                        _kodeposController.clear();
                                      },
                                      items: viewModel.getProvinsi.map((valueProvinsi){
                                        return DropdownMenuItem(
                                            value: valueProvinsi.provinsiId.toString(),
                                            child: Text(valueProvinsi.provinsiName.toString()),);
                                      }).toList(),
                                      onChanged: (newValueProvinsi) {
                                        setState(() {
                                          print('provinsi => ' + newValueProvinsi.toString());
                                          _provinsi = newValueProvinsi;
                                          _kota = null;
                                          _kecamatan  = null;
                                          _kelurahan = null;
                                        });
                                        viewModel.getDetailKota(newValueProvinsi.toString(), context);
                                      }
                                  ),
                                  SizedBox(height: 10,),
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
                                      onTap: (){
                                        _kodeposController.clear();
                                      },
                                      items: viewModel.getKota.map((valueKota){
                                        return DropdownMenuItem(
                                          value: valueKota.kabupatenKotaId.toString(),
                                          child: Text(valueKota.kabupatenKotaName.toString()),);
                                      }).toList(),
                                      onChanged: (newValueKota) {
                                        setState(() {
                                          print('kota => ' + newValueKota.toString());
                                          _kota = newValueKota;
                                          _kecamatan  = null;
                                          _kelurahan = null;
                                        });
                                        viewModel.getDetailKecamatan(newValueKota.toString(), context);
                                      }
                                  ),
                                  SizedBox(height: 10,),
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
                                    onTap: (){
                                      _kelurahan = null;
                                      _kodeposController.clear();
                                    },
                                      items: viewModel.getKecamatan.map((valueKecamatan){
                                        return DropdownMenuItem(
                                          value: valueKecamatan.kecamatanId.toString(),
                                          child: Text(valueKecamatan.kecamatanName.toString()),);
                                      }).toList(),
                                      onChanged: (newValueKecamatan) {
                                        setState(() {
                                          print('kecamatan => ' + newValueKecamatan.toString());
                                          _kecamatan = newValueKecamatan;
                                          _kelurahan = null;
                                        });
                                        viewModel.getDetailKelurahan(newValueKecamatan.toString(), context);
                                      },
                                  ),
                                  SizedBox(height: 10,),
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
                                      onTap: (){
                                        _kodeposController.clear();
                                      },
                                      items: viewModel.getKelurahan.map((valueKelurahan){
                                        return DropdownMenuItem(
                                          onTap: () => _kodeposController.text = valueKelurahan.kodePos.toString(),
                                          value: valueKelurahan.kodePos.toString(),
                                          child: Text(valueKelurahan.kelurahanDesaName.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (newValueKelurahan) {
                                        setState(() {
                                          print('kelurahan => ' + newValueKelurahan.toString());
                                        });
                                        _kodeposController.text = newValueKelurahan.toString();
                                      },
                                    // onTap: (){
                                    //   _kodeposController.clear();
                                    // },
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Kode Pos"),
                                      Text(" *", style: TextStyle(color: Colors.red),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    controller: _kodeposController,
                                    onTap: (){
                                      _kodeposController.clear();
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
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("Kebun"),
                        ),
                        Center(
                          child: Text("Dokumen"),
                        ),
                        Center(
                          child: Text("Sertifikasi"),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
