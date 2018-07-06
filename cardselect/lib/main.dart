import 'package:flutter/material.dart';

main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Selectable Card",
      home: OrientationList(),
    );
  }
}

class OrientationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new OrientationBuilder(
        builder: (context, orientation) {
          return new GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 5 : 2,
            // Generate 100 Widgets that display their index in the List
            children: new List.generate(100, (index) {
              return new Card(
                child: Cardy(),
              );
            }),
          );
        },
      ),
    );
  }
}

class Cardy extends StatefulWidget {
  @override
  _CardyState createState() => new _CardyState();
}

class _CardyState extends State<Cardy> {
  var SelectedState = false;
  var mycolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: mycolor,
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: SelectedState,
            leading: const Icon(Icons.info),
            title: new Text("Test"),
            subtitle: new Text("Test Desc"),
            trailing: new Text("3"),
            onLongPress: select // what should I put here,
            )
      ]),
    );
  }

  void select() {
    setState(() {
      if (SelectedState) {
        mycolor = Colors.white;
        SelectedState = false;
      } else {
        mycolor = Colors.grey[300];
        SelectedState = true;
      }
    });
  }
}
