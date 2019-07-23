import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'home.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  @override
  Widget build(BuildContext context) {
    final title = AppBar(
      title: Text("Web View"),
      backgroundColor: Colors.black87,
      actions: <Widget>[
        IconButton(
          icon: Icon(choices[0].icon),
          onPressed: () {
              var router = new MaterialPageRoute(builder: (BuildContext context) {
                return new Home();
              });
              Navigator.of(context).pushReplacement(router);
          },
        ),
      ],
    );
    return Scaffold(
      appBar: title,
      body: WebView(
        initialUrl: 'https://frcinventoryweb.firebaseapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Profile', icon: Icons.home),
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
