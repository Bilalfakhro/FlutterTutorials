import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

main() => runApp(new MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://swapi.co/api/people/";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJson();
  }

  Future<String> getJson() async {
    var response = await http.get(
        //Encode the URL
        Uri.encodeFull(url),
        //accept json request
        headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var convertDataToJson = JSON.decode(response.body);
      data = convertDataToJson['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve Json via Http"),
      ),
      body: new ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      child: Text(data[index]['name']),
                      padding: EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
