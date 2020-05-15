import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epd_admin/config.dart';
import 'package:epd_admin/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var adminID, password, adminToken;
  var _firestore = Firestore.instance.collection('Admin');
  FirebaseAuth _auth = FirebaseAuth.instance;
  loginUser() {
    ProgressDialog _dialog = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    _dialog.style(
        insetAnimCurve: Curves.bounceIn,
        message: "Logging...",
        backgroundColor: Colors.white,
        borderRadius: 25,
        elevation: 8.0);
    _dialog.show();
    _auth
        .signInWithEmailAndPassword(email: adminID, password: password)
        .then((data) async {
      _dialog.update(message: "Almost done...");
      _firestore.document('login').setData({"token": adminToken}, merge: true);
      Fluttertoast.showToast(msg: "Login Successful");
      _dialog.hide();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((e) {
      _dialog.hide();
      Fluttertoast.showToast(msg: "Login Failed");
    });
  }

  getToken() {
    FirebaseMessaging().getToken().then((token) {
      setState(() {
        adminToken = token;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Image.asset('asset/images/auth.png'),
            SizedBox(
              height: 20.0,
            ),
            Text("Welcome Admin !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black54,
                )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        adminID = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: "Enter Admin ID",
                        labelText: "Admin ID",
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: "Enter Admin Password",
                        labelText: "Admin Password",
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 40.0,
                    color: Config.primaryColor,
                    onPressed: loginUser,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
