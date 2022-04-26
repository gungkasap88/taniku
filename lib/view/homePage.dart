import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/detailKebun.dart';
import 'package:taniku/viewmodel/home_viewmodel.dart';

import '../viewmodel/detailNews.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // Untuk Google Maps
  Completer<GoogleMapController> _completer = Completer();
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
                    // appBar: AppBar(
                    //   title: Text("List Kebun"),
                    // ),
                    body: SafeArea(
                      //margin: const EdgeInsets.all(16),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.search,
                                          color: Colors.grey,),
                                        border: InputBorder.none,
                                        hintText: "Search News",
                                        filled: true,
                                        fillColor: Colors.grey[300]
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),

                                const Text("Good Morning",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5,),
                                const Text("Explore The World with One Click",
                                  style: TextStyle(
                                      fontSize: 16,),
                                ),
                                SizedBox(height: 10,),

                                //-------------------- ListView Horizontal ---------------------
                                SizedBox(
                                  width: double.infinity,
                                  height: 180,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel.getNews.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) =>
                                                    detailNews(
                                                      newsImage: viewModel.getNews[index].newsImage.toString(),
                                                      newsTitle: viewModel.getNews[index].newsTitle.toString(),
                                                      newsDate: viewModel.getNews[index].newsDate.toString(),
                                                    )
                                                )
                                            );
                                          },
                                          child: Container(
                                            //width: 300,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Image.network(
                                                      "https://picsum.photos/id/${210 + index}/500/300",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 100,left: 15,right: 10,bottom: 5),
                                                  child: Column(
                                                    children: [
                                                      Text(viewModel.getNews[index].newsTitle.toString(),
                                                          style: const TextStyle(
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white)
                                                      ),
                                                      const SizedBox(height: 8,),
                                                      Text(viewModel.getNews[index].newsDate.toString(),
                                                          style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white)
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),

                                SizedBox(height: 15,),

                                //-------------------- Detail Kebun Petani Card ---------------------
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: viewModel.getKebun.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  detailKebun(kebunId: viewModel.getKebun[index].id.toString()),
                                              )
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.grey, width: 1),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            elevation: 5,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding: EdgeInsets.all(12),
                                                    decoration: BoxDecoration(color: Colors.green),
                                                    child: const Text(
                                                      'Kebun Petani',
                                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: new EdgeInsets.all(20),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Luas Kebun',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].luasKebun.toString(),
                                                              style: TextStyle(
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text('Jumlah Pohon',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].jumlahPohon.toString(),
                                                              style: TextStyle(
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text('Tahun Tanam',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].tahunTanamId.toString()),
                                                            //SizedBox(height: 10,),
                                                          ],
                                                        ),
                                                        Column(
                                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Lokasi',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].kelurahanName.toString()),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].kecamatanName.toString()),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].kabupatenKotaName.toString()),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].provinsiName.toString()),
                                                            SizedBox(height: 5,),
                                                            Text(viewModel.getKebun[index].kodePos.toString()),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                    //height: height*0.3,
                                                    height: 400,
                                                    width: double.infinity,
                                                    child: GoogleMap(
                                                      mapType: MapType.normal,
                                                      markers: <Marker> {Marker(markerId: const MarkerId("1"),
                                                          position: LatLng(double.parse(viewModel.getKebun[index].latitude.toString()),
                                                              double.parse(viewModel.getKebun[index].longitude.toString())))},
                                                      initialCameraPosition: CameraPosition(
                                                          target: LatLng(double.parse(viewModel.getKebun[index].latitude.toString()),
                                                              double.parse(viewModel.getKebun[index].longitude.toString())), zoom: 15),
                                                      onMapCreated: (GoogleMapController controller) {
                                                        _completer.complete(controller);
                                                      },
                                                    ),
                                                  ),
                                                  // Container(
                                                  //   margin: EdgeInsets.only(left: 10, right: 10),
                                                  //   //height: height*0.3,
                                                  //   width: double.infinity,
                                                  //   child: GoogleMap(
                                                  //     mapType: MapType.normal,
                                                  //     markers: <Marker> {Marker(markerId: const MarkerId("1"),
                                                  //         position: LatLng(double.parse(viewModel.getDetail[index].latitude.toString()),
                                                  //             double.parse(viewModel.getDetail[index].longitude.toString())))},
                                                  //     initialCameraPosition: CameraPosition(
                                                  //         target: LatLng(double.parse(viewModel.getDetail[index].latitude.toString()),
                                                  //             double.parse(viewModel.getDetail[index].longitude.toString())), zoom: 15),
                                                  //     onMapCreated: (GoogleMapController controller) {
                                                  //       _completer.complete(controller);
                                                  //     },
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),

                                //-------------------- List Detail Kebun ---------------------

                                // ListView.builder(
                                //   shrinkWrap: true,
                                //   itemCount: viewModel.getKebun.length,
                                //   physics: const NeverScrollableScrollPhysics(),
                                //   itemBuilder: (context, index) {
                                //     return InkWell(
                                //       onTap: () {
                                //         Navigator.push(context,
                                //             MaterialPageRoute(builder: (context) =>
                                //                 detailKebun(kebunId: viewModel.getKebun[index].id.toString()),
                                //             )
                                //         );
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                //         child: Container(
                                //           width: 300,
                                //           padding: EdgeInsets.all(20),
                                //           decoration: BoxDecoration(
                                //             color: Colors.deepPurple,
                                //             borderRadius: BorderRadius.circular(16),
                                //           ),
                                //           child: Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             children: [
                                //               SizedBox(height: 10,),
                                //               Text('Kebun Petani',
                                //                 style: TextStyle(
                                //                   color: Colors.white,
                                //                   fontSize: 20,
                                //                 ),
                                //               ),
                                //               SizedBox(height: 20,),
                                //               Row(
                                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //                 children: [
                                //                   Column(
                                //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //                     children: [
                                //                       Text('Luas Kebun',
                                //                         style: TextStyle(
                                //                             color: Colors.white,
                                //                             fontWeight: FontWeight.bold
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].luasKebun.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text('Jumlah Pohon',
                                //                         style: TextStyle(
                                //                             color: Colors.white,
                                //                             fontWeight: FontWeight.bold
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].jumlahPohon.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text('Tahun Tanam',
                                //                         style: TextStyle(
                                //                             color: Colors.white,
                                //                             fontWeight: FontWeight.bold
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].tahunTanamId.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       //SizedBox(height: 10,),
                                //                     ],
                                //                   ),
                                //                   Column(
                                //                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //                     crossAxisAlignment: CrossAxisAlignment.start,
                                //                     children: [
                                //                       Text('Lokasi',
                                //                         style: TextStyle(
                                //                             color: Colors.white,
                                //                             fontWeight: FontWeight.bold
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].kelurahanName.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].kecamatanName.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].kabupatenKotaName.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].provinsiName.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                       SizedBox(height: 5,),
                                //                       Text(viewModel.getKebun[index].kodePos.toString(),
                                //                         style: TextStyle(
                                //                           color: Colors.white,
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   )
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),

                                SizedBox(height: 15,),

                                //-------------------- ListView Vertical ---------------------
                                const Text("Hot News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                const SizedBox(height: 15,),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: viewModel.getNews.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>
                                                detailNews(
                                                  newsImage: viewModel.getNews[index].newsImage.toString(),
                                                  newsTitle: viewModel.getNews[index].newsTitle.toString(),
                                                  newsDate: viewModel.getNews[index].newsDate.toString(),
                                                )
                                            )
                                        );
                                      },
                                      child: Container(
                                        child: Card(
                                          child: Container(
                                            margin: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Image.network(viewModel.getNews[index].newsImage.toString(), width: 70, height: 70,),
                                                const SizedBox(width: 12,),
                                                Text(viewModel.getNews[index].newsTitle.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 8,),
                                                Text(viewModel.getNews[index].newsDate.toString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 20,),
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
