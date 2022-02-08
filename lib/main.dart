// @dart=2.9
import 'dart:async';

import 'package:strix_covid19_tracker/datasource.dart';
import 'package:flutter/material.dart';
import 'package:strix_covid19_tracker/homepage.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryBlack,
        // brightness: Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });

    return Scaffold(
      backgroundColor: primaryBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                'assets/icons/icon.png',
                height: 120,
              )),
          SizedBox(
            height: 300,
          ),
          Text(
            'COVID-19 TRACKER',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(height: 50,),
          Center(
            child: Text(
              'Designed & Developed by',
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Center(
            child: GestureDetector(
              onTap: () {
                launch('https://donthamsettisreeharsha.web.app/');
              },
              child: Text(
                'HarshaStrix',
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
