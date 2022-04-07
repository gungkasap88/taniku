import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/buttonNav.dart';
import 'package:taniku/view/registerPage.dart';
import 'package:taniku/view/welcomePage.dart';
import 'dart:math';

import 'package:taniku/viewmodel/login_viewmodel.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(context),
      child: Builder(
        builder: (context) {
          return Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
            return Scaffold(
              resizeToAvoidBottomInset: false, //menghilangkan yellow cross
              body: Form(
                key: _formkey,
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("https://s3-ap-southeast-1.amazonaws.com/8villages/5964d404-6dd3-4867-a374-ea01660b1a85-mobile.png",
                          // width: 100,
                          // height: 100,
                        ),
                        const SizedBox(height: 10,),
                        const Text("TANIKU",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            labelText: "Username",
                            hintText: "contoh : indocyber"
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            labelText: "Pasword",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          child: Text("Log in"),
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.green,
                              //onSurface: Colors.grey,
                              //side: BorderSide(color: Colors.black, width: 1),
                              //elevation: 20,
                              minimumSize: Size(330,50),
                              //shadowColor: Colors.teal,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10
                              )
                          ),
                          
                          onPressed: () async {
                            if (_formkey.currentState!.validate()){
                              String username = usernameController.text.toString();
                              String password = passwordController.text.toString();
                              viewModel.loginview(username, password, context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
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
                          
                          // onPressed: () {
                          //   setState(() {
                          //     if (_formKey.currentState!.validate()) {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => buttonNav()
                          //           )
                          //       );
                          //       print("text 1 value => " + textController.text);
                          //       print("text 2 value => " + text2Controller.text);
                          //
                          //       print("checkbox value => " + checkedValue.toString());
                          //       print("checkbox value => " + _selectedGender.toString());
                          //     } else {
                          //       print("Lengkapi data");
                          //       showDialog(
                          //           context: context,
                          //           builder: (_) => AlertDialog(
                          //             title: Text('Informasi'),
                          //             content: Text('Silahkan Lengkapi Data Anda'),
                          //             actions: [
                          //               TextButton(
                          //                 child: Text("OK"),
                          //                 onPressed: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //               ),
                          //             ],
                          //           )
                          //       );
                          //     }
                          //   });
                          // },
                        ),
                        const SizedBox(height: 5,), //sidebox buat jarak antar gambar atau tulisan
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
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text(
                            "--------------------  or  --------------------"),
                        const SizedBox(height: 15,),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()
                              )
                          );
                        },
                            icon: Image.network("https://clipartspub.com/images/facebook-logo-clipart-vector-8.png",
                              width: 35,
                              height: 35,
                            ),
                            label: Text("Sign Up with Facebook"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onPrimary: Colors.white,
                              side: BorderSide(color: Colors.lightBlue, width: 1),
                              minimumSize: Size(330,50),//elevated btton background color
                            )
                        ),
                        const SizedBox(height: 15,),
                        ElevatedButton.icon(onPressed: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()
                              )
                          );
                        },
                            icon: Image.network("https://www.raqnbeauty.com/wp-content/uploads/2020/06/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png",
                              width: 25,
                              height: 25,
                            ),
                            label: Text("Sign Up with Google"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.blueAccent,
                              side: BorderSide(color: Colors.lightBlue, width: 1),
                              minimumSize: Size(330,50),//elevated btton background color
                            )
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                            },
                              child: Text("Sign up", style: TextStyle(color: Colors.blue),),
                            )
                          ],
                        ),
                      ],
                    ),
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
