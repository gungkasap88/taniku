import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_viewmodel.dart';
import '../viewmodel/profil_viewmodel.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfilViewModel>(
      create: (context) => ProfilViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<ProfilViewModel>(
              builder: (context, viewModel, child){
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Color(0xFFF1f1f1),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF22215B),
                        ),
                      ),
                      title: Text(
                        'My Profile',
                        style: TextStyle(
                          color: Color(0xFF22215B),
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color(0xFF22215B),
                          ),
                        ),
                      ],
                      centerTitle: true,
                    ),
                    body: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 75,
                                        height: 75,
                                        child: Image.network(
                                          "https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        viewModel.dataProfile.typeUser.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF22215B),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        viewModel.dataProfile.mobile.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF22215B).withOpacity(0.6),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    )
                );
              });
        },
      ),
    );
  }
}
