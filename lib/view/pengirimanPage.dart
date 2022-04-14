import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../viewmodel/penggiriman_viewmodel.dart';

class PengirimanPage extends StatefulWidget {
  const PengirimanPage({Key? key}) : super(key: key);

  @override
  State<PengirimanPage> createState() => _PengirimanPageState();
}

class _PengirimanPageState extends State<PengirimanPage> {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PengirimanViewModel>(
      create: (context) => PengirimanViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<PengirimanViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: Text('Daftar Reservasi Pengiriman TBS'),
                    backgroundColor: Colors.green,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.doorbell,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // do something
                        },
                      )
                    ],
                  ),
                  body: SafeArea(
                    child: ListView(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: viewModel.getPengiriman.length,
                            itemBuilder: (context, index) {
                              var _status = int.parse(viewModel.getPengiriman[index].status.toString());
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                            padding: new EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor: Colors.grey[100],
                                                      child: Icon(Icons.account_balance),
                                                    ),
                                                    SizedBox(width: 7,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(viewModel.getPengiriman[index].tanggalPengiriman.toString(),
                                                          style: TextStyle(fontSize: 12),),
                                                        SizedBox(height: 5,),
                                                        Text(viewModel.getPengiriman[index].noReservasi.toString(),
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(viewModel.getPengiriman[index].namaPabrik.toString(),
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(viewModel.getPengiriman[index].tonasi.toString() + ' kg',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.green,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 30,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 60),
                                                      child: Text(viewModel.getPengiriman[index].statusName.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12,
                                                            color: Colors.green
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(width: 50,),
                                                    Visibility(
                                                        visible: _status == 1 ? true : false,
                                                      child: ElevatedButton.icon(
                                                          onPressed: (){
                                                            showDialog(context: context, builder: (_) => AlertDialog(
                                                              title: Container(
                                                                  width: double.maxFinite,
                                                                  padding: EdgeInsets.all(12),
                                                                  decoration: BoxDecoration(color: Colors.green),
                                                                  child: Text('QR Code\n' + viewModel.getPengiriman[index].noReservasi.toString())),
                                                              content: Container(
                                                                width: 200,
                                                                height: 200,
                                                                child: Center(
                                                                  child: QrImage(
                                                                    version: 6,
                                                                    backgroundColor: Colors.grey.shade200,
                                                                    foregroundColor: Colors.black,
                                                                    errorCorrectionLevel: QrErrorCorrectLevel.M,
                                                                    padding: EdgeInsets.all(10),
                                                                    data: viewModel.getPengiriman[index].noReservasi.toString(),
                                                                  ),
                                                                ),
                                                              ),
                                                              actions: [
                                                                TextButton(onPressed: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                  child: Text("Oke")
                                                                  ,)
                                                              ],
                                                            ));
                                                          },
                                                          icon: Icon(Icons.wifi_tethering),
                                                          label: Text("")),
                                                    ),
                                                    Visibility(
                                                      visible: _status == 1 ? true : false,
                                                      child: ElevatedButton(
                                                        child: Text("Jadwal Ulang"),
                                                        style: ElevatedButton.styleFrom(
                                                          onPrimary: Colors.white,
                                                          primary: Colors.redAccent,
                                                          onSurface: Colors.grey,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                        ),
                                                        onPressed:() {
                                                          showDialog(context: context, builder: (_) => AlertDialog(
                                                            title: Text('Reschedule Pengiriman TBS'),
                                                            content: Container(
                                                              width: 400,
                                                              height: 200,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Tanggal",
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        fontWeight: FontWeight.w500
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 10,),
                                                                  TextField(
                                                                    controller: dateC,
                                                                    onTap: () {
                                                                      _selectDate(context);
                                                                      showDate = true;
                                                                    },
                                                                    style:
                                                                    new TextStyle(fontSize: 16.0,),
                                                                    decoration: new InputDecoration(
                                                                      hintText: viewModel.getPengiriman[index].createdDate.toString(),
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
                                                                  SizedBox(height: 10,),
                                                                  Text("Waktu",
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        fontWeight: FontWeight.w500
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 15),
                                                                  TextField(
                                                                    controller: timeC,
                                                                    onTap: () {
                                                                      _selectTime(context);
                                                                      showTime = true;
                                                                    },
                                                                    style:
                                                                    new TextStyle(fontSize: 16.0,),
                                                                    decoration: new InputDecoration(
                                                                      hintText: viewModel.getPengiriman[index].createdDate.toString(),
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
                                                                  SizedBox(height: 15,),

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
                                                                        onPressed:() async {
                                                                          Navigator.pop(context);
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                                ,)
                                                            ],
                                                          ));
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Visibility(
                                                      visible: _status == 2 ? true : false,
                                                      child: ElevatedButton(
                                                        child: Text("Faktur"),
                                                        style: ElevatedButton.styleFrom(
                                                          onPrimary: Colors.white,
                                                          primary: Colors.redAccent,
                                                          onSurface: Colors.grey,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                        ),
                                                        onPressed:() {
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
