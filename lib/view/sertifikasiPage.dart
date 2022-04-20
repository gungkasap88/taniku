import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/tambahkebun_viewmodel.dart';

class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({Key? key}) : super(key: key);

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
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
                      padding: const EdgeInsets.all(25),
                      child: Form(
                          child: Center(
                            child: ElevatedButton(
                                child: Text("Tambah Sertifikat", style: TextStyle(color: Colors.deepOrange, fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.white,
                                onSurface: Colors.grey,
                                side: BorderSide(color: Colors.orange, width: 2),
                                minimumSize: Size(350,60),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              onPressed:() {},
                            ),
                          )
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
