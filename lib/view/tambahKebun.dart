import 'package:flutter/material.dart';
import 'package:taniku/view/pengirimanPage.dart';
import 'package:taniku/view/profil_screen.dart';
import 'package:taniku/view/transaksiPage.dart';

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


  @override
  Widget build(BuildContext context) {
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
                      Text("Alamat"),
                      SizedBox(height: 10,),
                      TextFormField(
                        maxLines: 4,
                        decoration: new InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          hintText: "deskripsi",
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
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
                                Text("RT"),
                                SizedBox(height: 10,),
                                TextFormField(
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("RW"),
                                SizedBox(height: 10,),
                                TextFormField(
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Text("Trains"),
            ),
            Center(
              child: Text("Hotels"),
            ),
            Center(
              child: Text("Hot"),
            ),
          ],
        ),
      ),
    );
  }
}
