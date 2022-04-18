import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/tambahKebun.dart';
import 'package:taniku/viewmodel/detailKebun.dart';
import 'package:taniku/viewmodel/home_viewmodel.dart';
import 'package:taniku/viewmodel/profil_viewmodel.dart';

class Profil_Screen extends StatefulWidget {
  const Profil_Screen({Key? key}) : super(key: key);

  @override
  State<Profil_Screen> createState() => _Profil_ScreenState();
}

class _Profil_ScreenState extends State<Profil_Screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<HomeViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      backgroundColor: Colors.green,
                      title: Text('Profile'),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color(0xFF22215B),
                          ),
                        ),
                      ],
                    ),
                    body: SafeArea(
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.green,
                                      child: Image(image: NetworkImage("https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0")),
                                    ),
                                    Text(viewModel.dataProfile.nama.toString(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF22215B),
                                      ),
                                    ),
                                    SizedBox(width: 70,),
                                    ElevatedButton(
                                      child: Icon(Icons.arrow_forward_ios),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.orange,
                                        onSurface: Colors.grey,
                                        minimumSize: Size(70,50),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      ),
                                      onPressed:() {},
                                    )
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Kebun Saya",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                        )
                                    ),
                                    ElevatedButton(
                                      child: Text("+ Tambah Kebun"),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.orange,
                                        onSurface: Colors.grey,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      ),
                                      onPressed:() {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>
                                                TambahKebun(),
                                            )
                                        );
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: viewModel.getKebun.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Luas Kebun " + viewModel.getKebun[index].luasKebun.toString() + " hektar",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      PopupMenuButton(
                                                          onSelected: (value) {
                                                            setState(() {
                                                              if (value == 1 ) {
                                                                Navigator.push(context,
                                                                    MaterialPageRoute(builder: (context) =>
                                                                        detailKebun(kebunId: viewModel.getKebun[index].id.toString()),
                                                                    )
                                                                );
                                                              }else if (value == 2) {

                                                              }
                                                            });
                                                          },
                                                          itemBuilder: (context) => [
                                                            PopupMenuItem(value: 1, child: Text('Lihat Detail')),
                                                            PopupMenuItem(value: 2, child: Text('Ubah Data')),
                                                            PopupMenuItem(value: 3, child: Text('Hapus')),
                                                          ],
                                                          child: CircleAvatar(
                                                              radius: 20,
                                                              backgroundColor: Colors.pink[50],
                                                              child: Icon(Icons.more_horiz, color: Colors.deepOrange,),
                                                          ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text("Potensi Produk" + viewModel.getKebun[index].potensiProduksi.toString() + "Kg/Bulan",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: 12,),
                                                  Text("Potensi Produk" + viewModel.getKebun[index].statusLahanId.toString() + "Kg/Bulan",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Divider(thickness: 2, color: Colors.grey[300],)
                                                ],
                                              ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                );
              });
        },
      ),
    );
  }
}
