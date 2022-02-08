import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../datasource.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
        icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Color(0xff202c3b),
        title: Text(
          'Precautions',
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                          "assets/icons/coronadr.svg",
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 40,
                          left: 160,
                          child: Text(
                            "Get to know \nAbout Covid-19.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 22,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        DataSource.quote,
                        style: TextStyle(
                            //color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Symptoms", style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Caugh",
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Prevention",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,),),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask", key: null,
                  ),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands", key: null,
                  ),
                  SizedBox(height: 50),
                ],
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



class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: Card(
        elevation: 3.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          //side: BorderSide( color: Colors.lightBlueAccent.shade100 ,width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              Image.asset(image, height: 90),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: Color(0xFFB7B7B7).withOpacity(.16),
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
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