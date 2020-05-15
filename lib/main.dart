import 'dart:async';
import 'package:epd_admin/config.dart';
import 'package:epd_admin/methods/firebasemethods.dart';
import 'package:epd_admin/views/home.dart';
import 'package:epd_admin/views/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      title: "EPD Admin",
      theme: ThemeData(
          fontFamily: "Raleway",
          primaryColor: Config.primaryColor,
          accentColor: Config.primaryColor),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMethods _methods = FirebaseMethods();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      if (await _methods.isLoggedIn()) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Config.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "EPD Admin",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 50.0,
              ),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
