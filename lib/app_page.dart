import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/image_page.dart';
import 'package:flutter_app/mine_page.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  List<Widget> myTabs = [];
  TabController controller;
  String _kAsset0 =
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=797634051,1683868217&fm=27&gp=0.jpg';
  static List tabData = [
    {'text': '首页', 'icon': new Icon(Icons.home)},
    {'text': '知识体系', 'icon': new Icon(Icons.image)},
    {'text': '我的', 'icon': new Icon(Icons.person)},
  ];

  @override
  void initState() {
    super.initState();
    controller = new TabController(initialIndex: 0, length: 3, vsync: this);

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[HomePage(_kAsset0), ImagePage(), MinePage()],
      ),
      bottomNavigationBar: Material(
          elevation: 1.0,
          color: Color(0xFFF5F5F5),
          child: TabBar(
            tabs: myTabs,
            indicatorWeight: 0.1,
            controller: controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          )),
//      drawer: _CustomDrawer(_kAsset0),
    );
  }
}

///Drawer
class _CustomDrawer extends StatelessWidget {
  String img;
  List<Widget> widgets = [];

  _CustomDrawer(this.img) {
    for (int i = 0; i < 15; i++) {
      widgets.add(ListTile(
          title: Text("Huang"),
          leading: Image(
            width: 40.0,
            height: 40.0,
            image: NetworkImage(img),
          ),
          trailing: Icon(Icons.keyboard_arrow_right)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Huang Brayant'),
              accountEmail: Text('15378412400@163.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(img),
              )),
          Column(
//            shrinkWrap: true,
            children: widgets,
          ),
        ],
      ),
    );
  }
}
