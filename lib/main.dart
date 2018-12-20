import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var _currentIndex = 0;

  String _kAsset0 =
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=797634051,1683868217&fm=27&gp=0.jpg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('首页')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.wallpaper), title: new Text('图片')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.my_location), title: new Text('我的')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.map),
            title: new Text(_counter.toString()),
          ),
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Album'),
          ),
          new ListTile(
            leading: new Icon(Icons.phone),
            title: new Text(
              'Phone',
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.account_balance),
            title: new Text('Phone'),
          ),
          new ListTile(
            leading: new Icon(Icons.access_time),
            title: new Text('Phone'),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Huang Brayant'),
              accountEmail: new Text('15378412400@163.com'),
              currentAccountPicture:
                  new CircleAvatar(backgroundImage: new AssetImage(_kAsset0)),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(backgroundImage: new AssetImage(_kAsset0)),
                new CircleAvatar(backgroundImage: new AssetImage(_kAsset0)),
              ],
              onDetailsPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
