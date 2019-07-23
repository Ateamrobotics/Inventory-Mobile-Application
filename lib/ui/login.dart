import 'package:flutter/material.dart';
import 'package:inventory_mobile_application/ui/profile.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Arial', fontSize: 20.0);
  final GlobalKey<ScaffoldState> _scaffoldKey =
  new GlobalKey<ScaffoldState>(); //Key to identify scaffold
  final TextEditingController username =
  new TextEditingController(); //Text editing controller
  final TextEditingController password =
  new TextEditingController(); // Text editing controller

  @override
  Widget build(BuildContext context) {
    TextStyle field = TextStyle(
      fontFamily: 'Arial',
      fontSize: MediaQuery.of(context).size.width / 24,
    );
    final title = AppBar(
      title: Text("Login"),
      backgroundColor: Colors.black87,
    );
    final emailField = TextField(
      controller: username,
      obscureText: false,
      style: field,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        hintText: "Username",
        icon: Icon(Icons.person),
      ),
    );
    final passwordField = TextField(
      controller: password,
      obscureText: true,
      style: field,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        hintText: "Password",
        icon: Icon(Icons.lock),
      ),
    );
    final helpButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red.shade700,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _showDialog();
        },
        child: Text("Help?",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue.shade700,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          var router = new MaterialPageRoute(builder: (BuildContext context) {
            return new Profile();
          });
          Navigator.of(context).push(router);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: title,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "images/FIRSTRegionalVert_Canada.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    helpButton,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Information"),
          content: new Text(
              "Welcome the FRC mobile app. You can use this app to manage your team, messaging, project management,create metting dates. If you need help getting started or don't have a login click yes. Created by A-Team Robotics 2019."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "No",
                style: TextStyle(color: Colors.blueGrey),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new FlatButton(
              child: new Text(
                "Yes",
                style: TextStyle(color: Colors.blueGrey),
              ),
              onPressed: () {
                var router = new MaterialPageRoute(builder: (BuildContext context) {
                  return new WebViewLogin();
                });
                Navigator.of(context).pushReplacement(router);
              },
            ),
          ],
        );
      },
    );
  }
}


class WebViewLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewLoginState();
  }
}

class WebViewLoginState extends State<WebViewLogin> {

  @override
  Widget build(BuildContext context) {
    final title = AppBar(
      title: Text("Web View"),
      backgroundColor: Colors.black87,
    );
    return Scaffold(
      appBar: title,
      body: WebView(
        initialUrl: 'https://frcteamsapp.firebaseapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}