import 'package:strix_covid19_tracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  const CountryPage({Key key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    var url = Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries');
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          })
        ],
        backgroundColor: Color(0xff202c3b),
        centerTitle: true,
        title: Text('Country Stats'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              countryData[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 50,
                              width: 60,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'CONFIRMED: ' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'ACTIVE: ' +
                                    countryData[index]['active'].toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'RECOVERED: ' +
                                    countryData[index]['recovered'].toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'DEATHS: ' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
