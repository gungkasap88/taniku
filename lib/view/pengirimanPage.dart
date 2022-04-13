import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../viewmodel/penggiriman_viewmodel.dart';

class PengirimanPage extends StatefulWidget {
  const PengirimanPage({Key? key}) : super(key: key);

  @override
  State<PengirimanPage> createState() => _PengirimanPageState();
}

class _PengirimanPageState extends State<PengirimanPage> {
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
                                                              title: Text('QR Code\n' + 'Nomor Reservasi'),
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
