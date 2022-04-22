import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/response_sertifikasi.dart';
import 'package:taniku/viewmodel/sertifikasi_viewmodel.dart';


class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({Key? key}) : super(key: key);

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {

  var _sertifikasi;
  final nomor = TextEditingController();
  var dateC = TextEditingController();
  var timeC = TextEditingController();
  var dateTime;
  var tgl;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool showDate = false;
  bool showTime = false;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        tgl = DateFormat('yyyy-MM-dd').format(selectedDate);
        dateC.text = DateFormat.yMd().format(selectedDate);
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
        var hour = selectedTime.hour.toString();
        var minute = selectedTime.minute.toString();
        dateTime = " " + hour + ":" + minute + ":00 ";
        timeC.text = dateTime;
      });
    }
    return selectedTime;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SertifikasiViewModel>(
      create: (context) => SertifikasiViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<SertifikasiViewModel>(
              builder: (context, viewmodel, child) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Form(
                          child: Column(
                            children: [
                              Center(
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
                                  onPressed:() {
                                    showDialog(context: context, builder: (_) =>
                                        AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                                          ),
                                          titlePadding: EdgeInsets.all(0.0),
                                          title: Container(
                                            padding: EdgeInsets.all(20.0),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20.0),
                                                  topLeft: Radius.circular(20.0)
                                              ),
                                            ),
                                            child: Text("Tambah Sertifikat",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),
                                            ),
                                          ),
                                          content: Container(
                                            width: 500,
                                            height: 700,
                                            child: Form(
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("Tipe Sertifikasi"),
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
                                                        value: _sertifikasi,
                                                        items: viewmodel.dataSertifikasi.map((DataSertifikasi sertifikasi) {
                                                          return DropdownMenuItem(
                                                            value: sertifikasi.sertifikasiName.toString(),
                                                            child: Text(sertifikasi.sertifikasiName.toString()),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newSertifikasi) {
                                                          setState(() {
                                                            print('Tipe Dokumen = >' +newSertifikasi.toString());
                                                            _sertifikasi = newSertifikasi.toString();
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Text("Nomor Sertifikasi"),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
                                                      TextFormField(
                                                        controller: nomor,
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
                                              ),
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
                                                      onPressed:() {
                                                        Navigator.pop(context);
                                                        viewmodel.addUser(_sertifikasi, nomor.text, context);
                                                        _sertifikasi = "";
                                                        nomor.text = "";
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: viewmodel.listuser.isEmpty ? const Text("No Data") :
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: viewmodel.listuser.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                          child: ListTile(
                                            leading: const Icon(Icons.people),
                                            title: Text(viewmodel.listuser[index].sertifikat.toString()),
                                            subtitle: Text("Nomor :" + viewmodel.listuser[index].nosertifikat.toString()),
                                            trailing: Wrap(children: [

                                              IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),

                                              IconButton(onPressed: () async {
                                                viewmodel.deleteUser(viewmodel.listuser[index].id ?? 0, context);
                                              }, icon: const Icon(Icons.delete, color:Colors.red))

                                            ],
                                            ),
                                          ));
                                    }),
                              ),
                            ],
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
