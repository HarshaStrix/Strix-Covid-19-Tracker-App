import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  final Map worldData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
      children: [
        StatusPanel(
          title: 'CONFIRMED',
          panelColor: Colors.red.shade100,
          textColor: Colors.red,
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue.shade100,
          textColor: Colors.blue.shade900,
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green.shade100,
          textColor: Colors.green,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.grey.shade400,
          textColor: Colors.grey.shade900,
          count: worldData['deaths'].toString(),
        ),
      ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        //side: BorderSide( color: Colors.lightBlueAccent.shade100 ,width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      margin: EdgeInsets.all(10),
      //height: 80,
      //width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: textColor,fontWeight: FontWeight.bold, fontSize: 16),),
          Text(count, style: TextStyle(color: textColor,fontWeight: FontWeight.bold, fontSize: 16),),
        ],
      ),
    );
  }
}

