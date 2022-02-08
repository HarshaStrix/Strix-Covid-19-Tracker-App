import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                    suggestionList[index]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    suggestionList[index]['countryInfo']['flag'],
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
                          suggestionList[index]['cases'].toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ACTIVE: ' +
                          suggestionList[index]['active'].toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'RECOVERED: ' +
                          suggestionList[index]['recovered'].toString(),
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DEATHS: ' +
                          suggestionList[index]['deaths'].toString(),
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
    });
  }
}
