import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/view/loginPage.dart';
import 'package:taniku/view/registerPage.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left:30,top:10,right:30,bottom:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://s3-ap-southeast-1.amazonaws.com/8villages/5964d404-6dd3-4867-a374-ea01660b1a85-mobile.png",
              // width: 100,
              // height: 100,
            ),
            const SizedBox(height: 20,),
            const Text("TANIKU",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Discover upcoming events near you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 80,),
            ElevatedButton(
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: Size(150,50),
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 140
                  )
              ),
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => register()
                    )
                );
              },
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              child: Text("Log in"),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.green,
                  primary: Colors.white,
                  side: BorderSide(color: Colors.green, width: 1),
                  minimumSize: Size(150,50),
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 140
                  )
              ),
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loginPage()
                    )
                );
              },
            ),
            const SizedBox(height: 40,),
            TextButton(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => welcomePage()
                    )
                );
              },
              child: Text(
                "Skip for now",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
