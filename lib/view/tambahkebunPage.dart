import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/dokumentabmenu.dart';
import 'package:taniku/view/kebunPage.dart';
import 'package:taniku/view/kebuntabmenu.dart';
import 'package:taniku/view/sertifikasiPage.dart';
import 'package:taniku/view/tambahKebun.dart';
import '../viewmodel/addkebun_viewmodel.dart';
import 'db.dart';

class TambahKebunPage extends StatefulWidget {
  const TambahKebunPage({Key? key}) : super(key: key);

  @override
  State<TambahKebunPage> createState() => _TambahKebunPageState();
}

class _TambahKebunPageState extends State<TambahKebunPage> {

  List<Map> listData = [];
  MyDb myDatabase = MyDb();

  void getData(){
    Future.delayed(const Duration(milliseconds: 500),() async {
      listData = await myDatabase.db.rawQuery('SELECT * FROM users');
      setState(() { });
    });
  }

  @override
  void initState() {
    myDatabase.open();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddKebunViewModel>(
      create: (context) => AddKebunViewModel(),
      child: Builder(
        builder: (context) {
          return Consumer<AddKebunViewModel>(
              builder: (context, viewmodel, child) {
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
                          TambahKebun(parentViewModel: viewmodel),
                          KebunTabMenu(parentViewModel: viewmodel),
                          DokumenTabMenu(),
                          SertifikasiPage()
                        ],
                      ),
                    )
                );
              }
          );
        },
      ),
    );
  }
}
