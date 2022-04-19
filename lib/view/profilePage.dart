import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_viewmodel.dart';
import '../viewmodel/profil_viewmodel.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfilViewModel>(
      create: (context) => ProfilViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<ProfilViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                    appBar: AppBar(
                      //elevation: 0,
                      backgroundColor: Colors.green,
                      // leading: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.arrow_back_ios,
                      //     color: Color(0xFF22215B),
                      //   ),
                      // ),
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
                      //centerTitle: true,
                    ),
                    body: SafeArea(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),

                            //Profil Lama

                            // child: Container(
                            //   margin: EdgeInsets.symmetric(horizontal: 25),
                            //   padding: EdgeInsets.all(25),
                            //   decoration: BoxDecoration(
                            //     color: Colors.grey[300],
                            //     borderRadius: BorderRadius.circular(20),
                            //   ),
                            //   child: Container(
                            //     child: Stack(
                            //       children: [
                            //         Column(
                            //           children: [
                            //             Container(
                            //               width: 75,
                            //               height: 75,
                            //               child: Image.network(
                            //                 "https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0",
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //             SizedBox(height: 15),
                            //             Text(
                            //               viewModel.dataProfile.nama.toString(),
                            //               style: TextStyle(
                            //                 fontSize: 18,
                            //                 fontWeight: FontWeight.bold,
                            //                 color: Color(0xFF22215B),
                            //               ),
                            //             ),
                            //             SizedBox(height: 5),
                            //             Text(
                            //               viewModel.dataProfile.mobile.toString(),
                            //               style: TextStyle(
                            //                 fontSize: 16,
                            //               ),
                            //             ),
                            //             SizedBox(height: 15),
                            //             Text(
                            //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.",
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 color: Color(0xFF22215B).withOpacity(0.6),
                            //                 fontSize: 16,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(height: 20,),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            // Profil Baru

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
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
                                      onPressed:() { },
                                    )
                                  ],
                                ),
                                SizedBox(height: 30),
                                ListView.builder(
                                    itemCount: viewModel.getKebun.length,
                                    itemBuilder: (context, index) {
                                      return Column(
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
                                              ElevatedButton(
                                                child: Icon(Icons.menu_rounded, color: Colors.orange),
                                                style: ElevatedButton.styleFrom(
                                                  onPrimary: Colors.white,
                                                  primary: Colors.white,
                                                  onSurface: Colors.grey,
                                                  minimumSize: Size(70,50),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                ),
                                                onPressed:() {},
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    }
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
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
