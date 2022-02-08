import 'dart:convert';

import 'package:strix_covid19_tracker/datasource.dart';
import 'package:strix_covid19_tracker/pages/infoPage.dart';
import 'package:strix_covid19_tracker/panels/infoPanel.dart';
import 'package:strix_covid19_tracker/panels/mosteffectedcountries.dart';
import 'package:strix_covid19_tracker/pages/countryPage.dart';
import 'package:strix_covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:share/share.dart';
import 'NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    var url = Uri.parse('https://corona.lmao.ninja/v3/covid-19/all');
    http.Response response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    var url =
        Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.share_rounded),
              onPressed: () {
                Share.share(
                  "Look what Sree Harsha Donthamsetti - aka HarshaStrix made!\n\nI recommend Strix Covid Tracker app to fight against COVID19. Please download and share it using this link Android/iOS : https://bit.ly/HarshaStrixCovid-19TrackerApp",
                );
              },
            ),
          ),
        ],
        //centerTitle: true,
        backgroundColor: Color(0xff202c3b),
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: primaryBlack,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: Colors.blue,
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 8, right: 20),
                //margin: EdgeInsets.symmetric(horizontal: 20),
                //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
                  image: DecorationImage(
                    image: AssetImage("assets/images/virus.png"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.asset("assets/icons/menu.svg"),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Drcorona.svg",
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        // Image.asset(
                        //   "assets/icons/Drcorona.svg",
                        //   width: 230,
                        //   fit: BoxFit.fitWidth,
                        //   alignment: Alignment.topCenter,
                        // ),
                        Positioned(
                          top: 50,
                          left: 150,
                          child: Text(
                            "All you need \nis stay at home.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    )),
                  ],
                ),
              ),
            ),

            // Container(
            //   alignment: Alignment.center,
            //   padding: EdgeInsets.all(20),
            //   height: 100,
            //   //color: Colors.lightBlue.shade100,
            //   child: Text(
            //     DataSource.quote,
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WorldWide',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Card(
                      elevation: 10.0,
                      color: primaryBlack,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide( color: Colors.lightBlueAccent.shade100 ,width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Color(0xff202c3b),
                      //color: Colors.black.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        //side: BorderSide( color: Colors.lightBlueAccent.shade100 ,width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WorldwidePanel(
                          worldData: worldData,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          launch('https://www.cowin.gov.in/');
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Book your Vaccination slot",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "(For India only)",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 95,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage()));
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Covid-19\nPrecautions",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 95,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.icmr.gov.in/pdf/covid/techdoc/COVID_Clinical_Management_14012022.pdf');
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "ICMR\nGuidelines",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 95,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch('https://www.bbc.com/news/coronavirus');
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "BBC News\nCovid Updates",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 95,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Most affected Countries',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Total Cases',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Total Deaths',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            countryData == null
                ? Container()
                : Card(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    elevation: 3,
                    color: Colors.white,
                    child: MostAffectedPanel(
                      countryData: countryData,
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            InfoPanel(),
            SizedBox(
              height: 20.0,
            ),
            Center(
                child: Text(
              '\" WE ARE TOGETHER IN THIS FIGHT \"',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )),
            SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120),
                    topLeft: Radius.circular(120)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/icons/icon.png'),
                    ),
                    Center(
                      child: Text(
                        'STRIX',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Text(
                        'COVID-19 TRACKER',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: Text('v1.1.0')),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        'Designed & Developed by',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          launch('https://donthamsettisreeharsha.web.app/');
                        },
                        child: Text(
                          'HarshaStrix',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
