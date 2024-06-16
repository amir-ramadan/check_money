import 'package:application/screens/profile_user.dart';
import 'package:application/screens/sign_in_page.dart';
import 'package:application/screens/welcome.dart';
import 'package:application/test11.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'myTest.dart';
import 'screens/loading_page.dart';
import 'screens/login_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBGFDpDrVYQIKcI2oMrLFiS4q8Fd98WndQ',
        appId: '1:311608301088:android:dc23e1757cd267f87a4e45',
        messagingSenderId: 'sendid',
        projectId: 'money-95713',
        storageBucket: 'money-95713.appspot.com',
      )
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData( primarySwatch: Colors.teal,/* canvasColor: Colors.blueGrey ,backgroundColor: Colors.red ,*/ ) ,
      debugShowCheckedModeBanner: false,
     // darkTheme: ThemeData(primaryColor: Colors.blue,canvasColor: Colors.black),
      home: WelcomeHome(),
    );
  }
}
