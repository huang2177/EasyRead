import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/HomeGridItem.dart';
import 'package:flutter_app/widget/HomeItem.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }
}

class MineState extends State<MinePage> {
  List<HomeItem> widgets = [];
  List<HomeGridItem> Gridwidgets = [];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          body: new CustomScrollView(slivers: <Widget>[
            new SliverAppBar(
              //头部为一个SliverAppBar，折叠部分的内容都放在了flexibleSpace中。
              pinned: true,
//                    floating: true,//那么AppBar会在你做出下拉手势时就立即展开
              expandedHeight: 220.0,
              // 这个高度必须比flexibleSpace高度大
//            forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                  child: new Container(
                      width: 500.0,
                      height: 46.0,
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: new Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 5.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.search),
                            new Text('点击搜索',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.grey, fontSize: 16.0)),
                          ],
                        ),
                      )),
                  //只要你的控件实现了 preferredSize，就可以放到 AppBar 的 bottom 中使用。比如下图搜索栏，这是TabView下的页面又实用了AppBar。
                  preferredSize: new Size(double.infinity, 46.0)),

              flexibleSpace: new Container(
                child: new Column(
                  children: <Widget>[
                    new AppBar(
                      title: Text("首页"),
                      centerTitle: true,
                    ),
                    new Expanded(
                      child: new Container(
                        child: Image.asset(
                          "images/temp2.jpg",
                          fit: BoxFit.cover,
                        ),
                        width: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
            ),
//                SliverPersistentHeader(
////                pinned: true,
////                floating: true,
//                  delegate: _SliverAppBarDelegate(
//                      minHeight: 50.0,
//                      maxHeight: 50.0,
//                      child: new Container(
//                          width: 500,
//                          margin: EdgeInsets.only(
//                              left: 15.0, right: 15.0, top: 10.0),
//                          child: new Material(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(20.0),
//                            elevation: 5.0,
//                            child: new Center(
//                              child: new Text('点击搜索',
//                                  textAlign: TextAlign.center,
//                                  style: new TextStyle(
//                                      color: Colors.grey,
//                                      fontSize: 18
//                                  )
//                              ),
//                            ),
//                          )
//                      )
//                  ),
//                ),

            new SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return getItem(index);
                },
                childCount: widgets.length,
              ),
            ),

            new SliverToBoxAdapter(
              child: new Container(
                  margin: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Container(
                        child: new Text(
                          "新闻内容1",
                          style: new TextStyle(color: Colors.black45),
                        ),
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        margin: EdgeInsets.only(left: 15.0, right: 5.0),
                        height: 150.0,
                        decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(5.0)),
                            image: DecorationImage(
                                image: AssetImage("images/temp3.jpg"),
                                fit: BoxFit.cover)),
                      )),
                      new Expanded(
                          child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              "新闻内容2",
                              style: new TextStyle(color: Colors.black45),
                            ),
                            height: 70.0,
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            margin: EdgeInsets.only(
                              left: 5.0,
                              right: 15.0,
                              bottom: 5.0,
                            ),
                            width: double.infinity,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius
                                    .all(const Radius.circular(5.0)),
                                image: DecorationImage(
                                    image: AssetImage("images/temp3.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          new Container(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            margin: EdgeInsets.only(
                                left: 5.0, right: 15.0, top: 5.0),
                            child: new Text(
                              "新闻内容3",
                              style: new TextStyle(color: Colors.black45),
                            ),
                            height: 70.0,
                            width: double.infinity,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius
                                    .all(const Radius.circular(5.0)),
                                image: DecorationImage(
                                    image: AssetImage("images/temp3.jpg"),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ))
                    ],
                  )),
            ),

            new SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return getItem(index);
                },
                childCount: widgets.length,
              ),
            ),

            SliverPersistentHeader(
//                pinned: true,
//                floating: true,
              delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 180.0,
                  child: new Card(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    elevation: 5.0,
                    child: new Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        alignment: Alignment.bottomCenter,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1134704593,3837890513&fm=26&gp=0.jpg"),
                          fit: BoxFit.cover,
                        )),
                        child: new Text(
                          "这是中间一个条目",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                          ),
                        )),
                  )),
            ),

            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //一行多少个
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return getGridItem(index);
                },
                childCount: Gridwidgets.length,
              ),
            ),
          ]),
        ));
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 2; i++) {
      widgets.add(HomeItem(
          title: "大学生活",
          position: i,
          content: "啊啊啊啊啊啊啊啊啊啊啊啊啊",
          time: "2018-10-2",
          coverUrl:
              "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3155928136,23109883&fm=27&gp=0.jpg"));
    }

    for (var i = 0; i < 5; i++) {
      Gridwidgets.add(HomeGridItem(
          title: "大学生活",
          position: i,
          content: "啊啊啊啊啊啊啊啊啊啊啊啊啊",
          time: "2018-10-2",
          coverUrl:
              "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3155928136,23109883&fm=27&gp=0.jpg"));
    }
  }

  Widget getItem(int i) {
    return new HomeItem(
      title: widgets[i].title,
      position: widgets[i].position,
      content: widgets[i].content,
      time: widgets[i].time,
      coverUrl: widgets[i].coverUrl,
      callBack: (postition, item) {
        //Toast.toast(context, "position$postition");
      },
    );
  }

  Widget getGridItem(int i) {
    return new HomeGridItem(
      title: Gridwidgets[i].title,
      position: Gridwidgets[i].position,
      content: Gridwidgets[i].content,
      time: Gridwidgets[i].time,
      coverUrl: Gridwidgets[i].coverUrl,
      callBack: (postition, item) {
        //Toast.toast(context, "position$postition");
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
