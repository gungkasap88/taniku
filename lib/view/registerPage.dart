import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/loginPage.dart';
import 'package:taniku/view/welcomePage.dart';

import '../viewmodel/login_viewmodel.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                      margin: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network("https://s3-ap-southeast-1.amazonaws.com/8villages/5964d404-6dd3-4867-a374-ea01660b1a85-mobile.png",
                              // width: 80,
                              // height: 80,
                            ),
                            const SizedBox(height: 10,),
                            const Text("TANIKU",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Text("Register Account",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                labelText: "Nama",
                                hintText: "",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Nama tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: mobileController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                labelText: "No Telp",
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
                              obscureText: true,
                              controller: passwordController,
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
                            TextFormField(
                              obscureText: true,
                              controller: confirmPasswordController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                labelText: "Confirm Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15,),
                            ElevatedButton(
                              child: Text("Sign Up"),
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
                                  String user = 'PTN';
                                  String nama = nameController.text.toString();
                                  String nohp = mobileController.text.toString();
                                  String password = passwordController.text.toString();
                                  String confirmpassword = confirmPasswordController.text.toString();
                                  viewModel.register(user, nama, nohp, password, confirmpassword, context);

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
                            ),
                            const SizedBox(height: 15,), //sidebox buat jarak antar gambar atau tulisan
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(thickness: 2, color: Colors.black38,)
                                ),
                                const SizedBox(width: 10,),
                                Text("or"),
                                const SizedBox(width: 10,),
                                Expanded(
                                    child: Divider(thickness: 2, color: Colors.black38,)
                                ),
                              ],
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
                            const SizedBox(height: 10,),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("By signing up you accept the"),
                                    TextButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => welcomePage()));
                                    },
                                      child: Text("Terms of Service", style: TextStyle(color: Colors.blue),),
                                    ),
                                    Text("and"),
                                  ],
                                ),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => welcomePage()));
                                },
                                  child: Text("Privacy Policy", style: TextStyle(color: Colors.blue),),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
                                },
                                  child: Text("Sign In", style: TextStyle(color: Colors.blue),),
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
