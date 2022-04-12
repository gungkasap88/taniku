import 'package:flutter/material.dart';
import 'package:taniku/view/homePage.dart';
import 'package:taniku/view/profilePage.dart';

class buttonNav extends StatefulWidget {
  const buttonNav({Key? key}) : super(key: key);

  @override
  State<buttonNav> createState() => _buttonNavState();
}

class _buttonNavState extends State<buttonNav> {

  int currentIndex = 0;
  final List<Widget> body = [
    homePage(),
    profilePage(),
    homePage(),
    profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: ontap,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "Transaksi",
            icon: Icon(Icons.account_balance_wallet_rounded, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "Pengiriman",
            icon: Icon(Icons.delivery_dining_rounded, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person, color: Colors.black,),
          ),
        ],
      ),
    );
  }
  void ontap(int index){
    setState(() {
      currentIndex = index;
    });
  }
}
