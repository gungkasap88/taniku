import 'package:flutter/material.dart';
import 'package:taniku/view/dokumenPage.dart';
import 'package:taniku/view/kebunPage.dart';
import 'package:taniku/view/sertifikasiPage.dart';
import 'package:taniku/view/tambahKebun.dart';

class TambahKebunPage extends StatefulWidget {
  const TambahKebunPage({Key? key}) : super(key: key);

  @override
  State<TambahKebunPage> createState() => _TambahKebunPageState();
}

class _TambahKebunPageState extends State<TambahKebunPage> {
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
            ),
          ),
          body: TabBarView(
            children: [
              TambahKebun(),
              KebunPage(),
              DokumenPage(),
              SertifikasiPage()
            ],
          ),
        )
    );
  }
}
