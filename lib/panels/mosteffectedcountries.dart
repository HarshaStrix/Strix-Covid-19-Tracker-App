import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  final List countryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(countryData[index]['countryInfo']['flag'], height: 40,width: 50,),
              SizedBox(width: 8.0,),
              Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10.0,),
              Text(countryData[index]['cases'].toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              SizedBox(width: 10.0,),
              Text(countryData[index]['deaths'].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
            ],
          ),
        );
      },
      itemCount: 10,),
    );
  }
}

