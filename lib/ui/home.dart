import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_mobile_application/services/userManagement.dart';
import 'package:inventory_mobile_application/ui/webView.dart';

import 'checkout.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  UserManagement user = UserManagement();

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  void getBarcode(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Text("FRC Inventory App"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                if(user.getLoginState()){
                  var router = new MaterialPageRoute(builder: (BuildContext context) {
                    return new Login();
                  });
                  Navigator.of(context).push(router);
                }else{

                }
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), title: new Text('Basket')),
            BottomNavigationBarItem(
                icon: Icon(Icons.web), title: new Text('Manage')),
          ],
          onTap: (index) {
            if(index==0){
              var router = new MaterialPageRoute(builder: (BuildContext context) {
                return new Home();
              });
              Navigator.of(context).push(router);
            }else if(index==1){
              var router = new MaterialPageRoute(builder: (BuildContext context) {
                return new CheckOut();
              });
              Navigator.of(context).push(router);
            }else{
              var router = new MaterialPageRoute(builder: (BuildContext context) {
                return new WebViewPage();
              });
              Navigator.of(context).pushReplacement(router);
            }
          },
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: getBarcode,
                  child: Text(
                    "Scan",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue.shade800,
                )
              ],
            ),
          ),
        ));
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Profile', icon: Icons.person),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
