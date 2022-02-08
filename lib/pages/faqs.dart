import 'package:strix_covid19_tracker/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Color(0xff202c3b),title: Text('FAQs'),),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
        return ExpansionTile(
          title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.w500),),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 16.0,bottom: 30.0,right: 16.0),
              child: Text(DataSource.questionAnswers[index]['answer']),
            ),
          ],
        );
      }),
    );
  }
}
