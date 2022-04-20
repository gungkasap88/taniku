import 'package:flutter/material.dart';
import 'package:taniku/view/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'notificattion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const welcomePage(),
    );
  }
}

// class Hommy extends StatefulWidget {
//   const Hommy({Key? key}) : super(key: key);
//
//   @override
//   State<Hommy> createState() => _HommyState();
// }
//
// class _HommyState extends State<Hommy> {
//   String notificationTitle = 'No Title';
//   String notificationBody = 'No Body';
//   String notificationData = 'No Data';
//
//   @override
//   void initState() {
//     final firebaseMessaging = FCM();
//     firebaseMessaging.setNotifications();
//
//     firebaseMessaging.streamCtlr.stream.listen(_changeData);
//     firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
//     firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
//
//     super.initState();
//   }
//
//   _changeData(String msg) => setState(() => notificationData = msg);
//   _changeBody(String msg) => setState(() => notificationBody = msg);
//   _changeTitle(String msg) => setState(() => notificationTitle = msg);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               notificationTitle,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text(
//               notificationBody,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             Text(
//               notificationData,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }