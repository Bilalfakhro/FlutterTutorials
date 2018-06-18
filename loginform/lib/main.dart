import 'package:flutter/material.dart';

main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = SnackBar(
      content: Text("Email : $_email , password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (val) =>
                      !val.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Passwprd"),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short !' : null,
                  onSaved: (val) => _password = val,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ));
  }
}
