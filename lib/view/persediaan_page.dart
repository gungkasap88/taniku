import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/response_transaksi.dart';
import 'package:taniku/view/transaksiPage.dart';
import 'package:taniku/viewmodel/penggiriman_viewmodel.dart';

class PersediaanPage extends StatefulWidget {
  final Data transaksi;

  const PersediaanPage({Key? key, required this.transaksi}) : super(key: key);

  @override
  State<PersediaanPage> createState() => _PersediaanPageState();
}

class _PersediaanPageState extends State<PersediaanPage> {
  final _formkey = GlobalKey<FormState>();
  final pabrikController = TextEditingController();
  final tonasiController = TextEditingController();
  final _textEditingController = TextEditingController();

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
      });
    }
    return selectedTime;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('dd MMM yyyy').format(selectedDate);
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
    pabrikController.text = widget.transaksi.namaPabrik.toString();
    tonasiController.text = widget.transaksi.kapasitas.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PengirimanViewModel>(
        create: (context) => PengirimanViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<PengirimanViewModel>(
              builder: (context, viewModel, child) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: Text("Kirim Persediaan Stok"),
                    backgroundColor: Colors.green,
                  ),
                  body: Form(
                    key: _formkey,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: new EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Nama PKS",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          SizedBox(height: 7,),
                                          TextField(
                                            controller: pabrikController,
                                            style:
                                            new TextStyle(fontSize: 16.0,),
                                            decoration: new InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey.shade200,
                                              contentPadding: const EdgeInsets.only(
                                                  left: 20.0, bottom: 8.0, top: 8.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.white),
                                                borderRadius: new BorderRadius.circular(25.7),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.white),
                                                borderRadius: new BorderRadius.circular(25.7),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Tanggal",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    SizedBox(height: 7,),
                                                    TextField(
                                                      controller: _textEditingController,
                                                      onTap: () {
                                                        _selectDate(context);
                                                        showDate = true;
                                                      },
                                                      style:
                                                      new TextStyle(fontSize: 16.0,),
                                                      decoration: new InputDecoration(
                                                        hintText: getDate(),
                                                        suffixIcon: Icon(Icons.calendar_today),
                                                        contentPadding: const EdgeInsets.all(10),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: new BorderSide(color: Colors.black),
                                                          borderRadius: new BorderRadius.circular(25.7),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
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
                                                    Text("Waktu",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    SizedBox(height: 7,),
                                                    TextField(
                                                      controller: _textEditingController,
                                                      onTap: () {
                                                        _selectTime(context);
                                                        showTime = true;
                                                      },
                                                      style:
                                                      new TextStyle(fontSize: 16.0,),
                                                      decoration: new InputDecoration(
                                                        hintText: getTime(selectedTime),
                                                        suffixIcon: Icon(Icons.access_alarm_outlined),
                                                        contentPadding: const EdgeInsets.all(10),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: new BorderSide(color: Colors.black),
                                                          borderRadius: new BorderRadius.circular(25.7),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: new BorderSide(color: Colors.black),
                                                          borderRadius: new BorderRadius.circular(25.7),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Text("Estimasi Tonasi TBS (/kg)",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          TextField(
                                            controller: tonasiController,
                                            style:
                                            new TextStyle(fontSize: 16.0,),
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                              hintText: "Tonasi per kg",
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.black),
                                                borderRadius: new BorderRadius.circular(25.7),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.black),
                                                borderRadius: new BorderRadius.circular(25.7),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 50,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                child: Text("Batal", style: TextStyle(color: Colors.orange)),
                                                style: ElevatedButton.styleFrom(
                                                  onPrimary: Colors.white,
                                                  primary: Colors.white,
                                                  onSurface: Colors.grey,
                                                  side: BorderSide(color: Colors.orange, width: 2),
                                                  minimumSize: Size(150,50),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                                ),
                                                onPressed:() {
                                                },
                                              ),
                                              SizedBox(width: 10,),
                                              ElevatedButton(
                                                child: Text("Kirim", style: TextStyle(color: Colors.white)),
                                                style: ElevatedButton.styleFrom(
                                                  onPrimary: Colors.white,
                                                  primary: Colors.orange,
                                                  onSurface: Colors.grey,
                                                  minimumSize: Size(150,50),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                ),
                                                onPressed:() async {
                                                  if (_formkey.currentState!.validate()){
                                                    String pabrik = pabrikController.text.toString();
                                                    String tonasi = tonasiController.text.toString();
                                                    String tanggal= _textEditingController.text.toString();
                                                    viewModel.getDataPengiriman(context);

                                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                                                  } else  {
                                                    print ("Lengkapi data");
                                                    showDialog(context: context, builder: (_) => AlertDialog(
                                                      title: Text('Informasi'),
                                                      content: Text('Silahkan lengkapi data diri anda'),
                                                      actions: [
                                                        TextButton(onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                          child: Text("OKEY")
                                                          ,)
                                                      ],
                                                    ));
                                                  }
                                                },
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
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
