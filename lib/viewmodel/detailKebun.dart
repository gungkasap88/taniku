import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_kebun_viewmodel.dart';

class detailKebun extends StatefulWidget {
  const detailKebun({Key? key}) : super(key: key);

  @override
  State<detailKebun> createState() => _detailKebunState();
}

class _detailKebunState extends State<detailKebun> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListKebunViewModel>(
        create: (context) => ListKebunViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<ListKebunViewModel>(
              builder: (context, viewModel, child) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: const Text("Detail Kebun"),
                    backgroundColor: Colors.green,
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Detail Kebun
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.getDetail.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  child: Container(
                                    width: 300,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text('Kebun Petani',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(viewModel.getDetail[index].alamat.toString() +
                                        ', ' + viewModel.getDetail[index].kelurahanName.toString() +
                                        ', ' + viewModel.getDetail[index].kecamatanName.toString() +
                                        ', ' + viewModel.getDetail[index].kabupatenKotaName.toString() +
                                        ', ' + viewModel.getDetail[index].provinsiName.toString() +
                                        ', ' + viewModel.getDetail[index].kodePos.toString()),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Luas Kebun',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].luasKebun.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                                Text('Tipe Lahan',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].statusLahanName.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                                Text('Jumlah Pohon',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].jumlahPohon.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Jenis Bibit',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].jenisBibitName.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                                Text('Tahun Tanam',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].tahunTanamId.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                                Text('Produksi Perbulan',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDetail[index].potensiProduksi.toString(),
                                                  style: TextStyle(
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Foto Kebun',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                                          child: Image.network('https://www.wisataidn.com/wp-content/uploads/2020/07/Kebun-teh-sukawana-750x450.jpg',),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          // Dokumen
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.getDetail.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  child: Container(
                                    width: 300,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text('Dokumen',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.network('https://cdn.onlinewebfonts.com/svg/img_52693.png', height: 40, width: 40),
                                            SizedBox(width: 15,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(viewModel.getDokumen[index].dokumenName.toString()),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDokumen[index].nomor.toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Divider(thickness: 2, color: Colors.grey[300],),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.network('https://cdn.onlinewebfonts.com/svg/img_52693.png', height: 40, width: 40),
                                            SizedBox(width: 15,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(viewModel.getDokumen[index].dokumenName.toString()),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getDokumen[index].nomor.toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Divider(thickness: 2, color: Colors.grey[300],)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          // Sertifikasi
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.getDetail.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  child: Container(
                                    width: 300,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text('Sertifikasi',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.network('https://cdn.onlinewebfonts.com/svg/img_52693.png', height: 40, width: 40),
                                            SizedBox(width: 15,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(viewModel.getSertifikat[index].sertifikasiName.toString()),
                                                SizedBox(height: 5,),
                                                Text(viewModel.getSertifikat[index].sertifikasiNo.toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Divider(thickness: 2, color: Colors.grey[300],),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
