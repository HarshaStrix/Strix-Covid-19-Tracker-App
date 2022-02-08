import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:strix_covid19_tracker/pages/countryPage.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  launch('https://donthamsettisreeharsha.web.app/#strixcovidapp');
                },
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 16),
                          child: Image.asset('assets/icons/icon.png'),
                        ),
                      ),
                      Text('Strix Covid-19 Tracker'),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism,color: Colors.lightBlueAccent.shade400,),
              title: Text('Book Your Vaccination Slot'),
              onTap: () { launch('https://www.cowin.gov.in/'); },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined,color: Colors.lightBlueAccent.shade400,),
              title: Text('Country wise statistics'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.settings,color: Colors.lightBlueAccent.shade400,),
            //   title: Text('Settings'),
            //   onTap: () => null,
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.share, color: Colors.lightBlueAccent.shade400,),
              title: Text('Share'),
              onTap: () => {
              Share.share(
              "Look what Sree Harsha Donthamsetti - aka HarshaStrix made!\n\nI recommend Strix Covid Tracker app to fight against COVID19. Please download and share it using this link Android/iOS : https://bit.ly/HarshaStrixCovid-19TrackerApp"
              ),
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent,color: Colors.lightBlueAccent.shade400,),
              title: Text('Support'),
              onTap: () { launch('https://donthamsettisreeharsha.web.app/#strixcovidapp'); },
            ),
            ListTile(
              leading: Icon(Icons.design_services_outlined,color: Colors.lightBlueAccent.shade400,),
              title: Text('About Developer'),
              onTap: () { launch('https://donthamsettisreeharsha.web.app/'); },
            ),
            ListTile(
              leading: Icon(Icons.sentiment_satisfied_alt_rounded,color: Colors.lightBlueAccent.shade400,),
              title: Text('Support Developer'),
              onTap: () { launch('https://github.com/HarshaStrix'); },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.verified_user,color: Colors.lightBlueAccent.shade400,),
              title: Text('Privacy Policy',),
              onTap: () { launch('https://sites.google.com/view/harshastrixcovid19-tracker/home'); },
            ),
            ListTile(
              leading: Icon(Icons.description,color: Colors.lightBlueAccent.shade400,),
              title: Text('Terms of Use',),
              onTap: () { launch('https://sites.google.com/view/harshastrixcovid19-tracker/termsofuse'); },
            ),
            Divider(),
            Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(title: Text('App Version 1.1.0'))
            ),
          ],
    ),
        ),
    );
  }
}
