import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/tambahkebun_viewmodel.dart';

class KebunPage extends StatefulWidget {
  const KebunPage({Key? key}) : super(key: key);

  @override
  State<KebunPage> createState() => _KebunPageState();
}

class _KebunPageState extends State<KebunPage> {

  TextEditingController luaskebunC = TextEditingController();
  TextEditingController tipelahanC = TextEditingController();
  TextEditingController jumlahpohonC = TextEditingController();
  TextEditingController jenisbibitC = TextEditingController();
  TextEditingController tahuntanamC = TextEditingController();
  TextEditingController produksiC = TextEditingController();

  String dropdownTipe = 'Lahan Sendiri';
  String dropdownJenis = "Lonsum";

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
                        children: [
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                    children: [
                                      // --------------------------------- Luas Kebun ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Luas Kebun"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: luaskebunC,
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          hintText: "",
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

                                      // --------------------------------- Tipe Lahan ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Tipe Lahan"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      DropdownButtonFormField(
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black
                                        ),
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
                                        value: dropdownTipe,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownTipe = newValue!;
                                          });
                                        },
                                        items: <String>["Lahan Sendiri", "Sendiri", "Lahari", "Sendi"]
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(height: 10,),

                                      // --------------------------------- Jumlah Pohon ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Jumlah Pohon"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: jumlahpohonC,
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          hintText: "",
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
                                  )
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                  child: Column(
                                    children: [
                                      // --------------------------------- Jenis Bibit ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Jenis Bibit"),
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
                                        value: dropdownJenis,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownJenis = newValue!;
                                          });
                                        },
                                        items: <String>["Lonsum", "Nosul", "Sulom", "Mosul"]
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(height: 10,),

                                      // --------------------------------- Tahun Tanam ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Tahun Tanam"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: luaskebunC,
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          hintText: "",
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

                                      // --------------------------------- Produksi per Bulan ----------------------------------------
                                      Row(
                                        children: [
                                          Text("Prduksi per Bulan"),
                                          Text(" *", style: TextStyle(color: Colors.red),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        controller: produksiC,
                                        decoration: new InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                          hintText: "",
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
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          // --------------------------------- Foto Kebun ----------------------------------------
                          Row(
                            children: [
                              Text("Foto Kebun"),
                              Text(" *", style: TextStyle(color: Colors.red),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.image_outlined, size: 125,),
                                SizedBox(width: 50,),
                                ElevatedButton(
                                  child: Text("Unggah", style: TextStyle(color: Colors.orange, fontSize: 18)),
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    primary: Colors.white,
                                    onSurface: Colors.grey,
                                    minimumSize: Size(100,60),
                                    side: BorderSide(color: Colors.orange, width: 2),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                  ),
                                  onPressed:() {
                                    showDialog(context: context, builder: (_) => AlertDialog(
                                      title: Text('Pilih Aksi'),
                                      content: Container(
                                        width: 400,
                                        height: 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Divider(thickness: 2, color: Colors.red.shade500),
                                            SizedBox(height: 10,),
                                            Text("Tanggal",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text("Waktu",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            SizedBox(height: 15),

                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(onPressed: () {},
                                          child: Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                  child: Text("Tidak, Ubah", style: TextStyle(color: Colors.orange)),
                                                  style: ElevatedButton.styleFrom(
                                                    onPrimary: Colors.white,
                                                    primary: Colors.white,
                                                    onSurface: Colors.grey,
                                                    side: BorderSide(color: Colors.orange, width: 2),
                                                    minimumSize: Size(100,50),
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                                  ),
                                                  onPressed:() {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                SizedBox(width: 10,),
                                                ElevatedButton(
                                                  child: Text("Ya, Benar", style: TextStyle(color: Colors.white)),
                                                  style: ElevatedButton.styleFrom(
                                                    onPrimary: Colors.white,
                                                    primary: Colors.orange,
                                                    onSurface: Colors.grey,
                                                    minimumSize: Size(10,50),
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                  ),
                                                  onPressed:() async {},
                                                )
                                              ],
                                            ),
                                          )
                                          ,)
                                      ],
                                    ));
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60,),
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
                                onPressed:() {},
                              )
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
