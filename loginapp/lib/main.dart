import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new HomePage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assests/sample.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(size: _iconAnimation.value * 100),
                new Form(
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.teal, fontSize: 20.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                new InputDecoration(labelText: "Enter Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Password"),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          new MaterialButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     '/Home', (Route<dynamic> route) => false);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false);
                              // Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate)
                            },
                            splashColor: Colors.redAccent,
                            height: 40.0,
                            minWidth: 100.0,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ])
        ],
      ),
    );
  }
}
