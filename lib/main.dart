import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'パスワード管理'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listItem = ["Amazon", "楽天", "Yahoo!"];
  var id = ['kenji@amazon.com', 'kenji@rakuten.com', 'kenji@yahoo.com'];
  var pw = ['amazon123', 'rakuten123', 'yahoo123'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.attachment),
              title: Text('${listItem[index]}'),
              subtitle: Text('&listItem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondRoute(id: id[index], pw: pw[index])),
                );
              },
            ),
          );
        },
        itemCount: listItem.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listItem.add("google");
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  SecondRoute({this.id, this.pw});

  final String id;
  final String pw;

  @override
  SecondRouteState createState() => SecondRouteState();
}

class SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード確認"),
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 50, top: 30, bottom: 20),
              child: Row(children: <Widget>[
                Container(
                  width: 40,
                  child: Text('ID'),
                ),
                Text(widget.id),
              ])),
          Container(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    child: Text('PW'),
                  ),
                  Text(widget.pw)
                ],
              )),
        ],
      ),
    );
  }
}
