import 'package:epd_admin/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Config.primaryColor,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Fluttertoast.showToast(msg: "Logout success");
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Feather.log_out),
            color: Config.primaryColor,
            iconSize: 30,
          ),
        ],
        title: Row(
          children: <Widget>[
            Icon(
              Octicons.primitive_dot,
              size: 30.0,
              color: Config.primaryColor,
            ),
            SizedBox(width: 10.0),
            Text("EPD Admin",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    color: Config.primaryColor))
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Card(
              elevation: 10.0,
              borderOnForeground: true,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Agent Panel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Control your agents from here",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.eye),
                          color: Config.primaryColor,
                          iconSize: 30.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.plus_circle),
                          color: Config.primaryColor,
                          iconSize: 30.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Card(
              elevation: 10.0,
              borderOnForeground: true,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shopkeeper Panel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Control your shopkeeper from here",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.eye),
                          color: Config.primaryColor,
                          iconSize: 30.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.plus_circle),
                          color: Config.primaryColor,
                          iconSize: 30.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Card(
              elevation: 10.0,
              borderOnForeground: true,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Customer Panel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Check your customer details from here",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.eye),
                          color: Config.primaryColor,
                          iconSize: 30.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
            ),
          )
        ],
      ),
    );
  }
}
