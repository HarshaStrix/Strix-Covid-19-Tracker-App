import 'package:strix_covid19_tracker/datasource.dart';
import 'package:strix_covid19_tracker/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
              margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.0),
              color: Color(0xff202c3b),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('FAQs',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/en/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
              margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.0),
              color: Color(0xff202c3b),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WHO | DONATE',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch('https://www.who.int/westernpacific/emergencies/covid-19/information/mythbusters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
              margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.0),
              color: Color(0xff202c3b),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MYTH BUSTERS',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
