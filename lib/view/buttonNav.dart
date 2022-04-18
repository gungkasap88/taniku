import 'package:flutter/material.dart';
import 'package:taniku/view/homePage.dart';
import 'package:taniku/view/pengirimanPage.dart';
import 'package:taniku/view/profil_screen.dart';
import 'package:taniku/view/profilePage.dart';
import 'package:taniku/view/transaksiPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class buttonNav extends StatefulWidget {
  const buttonNav({Key? key}) : super(key: key);

  @override
  State<buttonNav> createState() => _buttonNavState();
}

class _buttonNavState extends State<buttonNav> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
      homePage(),
      TransaksiPage(),
      PengirimanPage(),
      Profil_Screen(),
  ];

  // int currentIndex = 0;
  // final List<Widget> body = [
  //   homePage(),
  //   TransaksiPage(),
  //   PengirimanPage(),
  //   profilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: ontap,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(Icons.home_outlined, color: Colors.black,),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Transaksi",
      //       icon: Icon(Icons.account_balance_wallet_rounded, color: Colors.black,),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Pengiriman",
      //       icon: Icon(Icons.delivery_dining_rounded, color: Colors.black,),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Profil",
      //       icon: Icon(Icons.person, color: Colors.black,),
      //     ),
      //   ],
      // ),
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: GNav(
              backgroundColor: Colors.green,
              color: Colors.white,
              activeColor: Colors.grey,
              tabBackgroundColor: Colors.white,
              gap: 5,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.account_balance_wallet_rounded,
                  text: 'Transaksi',
                ),
                GButton(
                  icon: Icons.delivery_dining_rounded,
                  text: 'Pengiriman',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
          ),
        ),
      )
    );
  }
  // void ontap(int index){
  //   setState(() {
  //     currentIndex = index;
  //   });
  }
