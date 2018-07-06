import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sumit Dobhal"),
              accountEmail: Text("sumit@themrolab-singapore.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: defaultTargetPlatform == TargetPlatform.iOS
                    ? Colors.purple
                    : Colors.white,
                child: Text("SD"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: defaultTargetPlatform == TargetPlatform.iOS
                      ? Colors.purple
                      : Colors.white,
                  child: Text("PK"),
                )
              ],
            ),
            ListTile(
              title: Text("Page One"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Page Two"),
              trailing: Icon(Icons.arrow_downward),
              onTap: () => {},
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
