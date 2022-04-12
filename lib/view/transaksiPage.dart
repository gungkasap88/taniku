import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/transaksi_viewmodel.dart';
import 'package:intl/intl.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransaksiViewModel>(
      create: (context) => TransaksiViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<TransaksiViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: Text('Daftar PKS'),
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
                              itemCount: viewModel.getTransaksi.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
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
                                              padding: new EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor: Colors.grey[100],
                                                        child: Icon(Icons.account_balance),
                                                      ),
                                                      SizedBox(width: 15,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Kuota ' +
                                                              viewModel.getTransaksi[index].kuota.toString() +
                                                              ' kg', style: TextStyle(fontSize: 16),),
                                                          SizedBox(height: 5,),
                                                          Text('Rp ' +
                                                              viewModel.getTransaksi[index].harga.toString() +
                                                              ',00',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                              color: Colors.green,
                                                              fontSize: 16
                                                            ),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Text('Kuota Terisi ' +
                                                              viewModel.getTransaksi[index].koutaTerisi.toString() +
                                                              '/' + viewModel.getTransaksi[index].kuota.toString() +
                                                              ' kg',style: TextStyle(fontSize: 16),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(viewModel.getTransaksi[index].namaPabrik.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      ElevatedButton(
                                                        child: Text("Kirim TBS"),
                                                        style: ElevatedButton.styleFrom(
                                                          onPrimary: Colors.white,
                                                          primary: Colors.redAccent,
                                                          onSurface: Colors.grey,
                                                          minimumSize: Size(150,50),
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                        ),
                                                        onPressed:() {

                                                        },
                                                      )
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
