import 'package:flutter/material.dart';

import 'package:readhub/app/app.dart';
import 'package:readhub/app/ui/web/WebPage.dart';

final readHubTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

void main() {
  runApp(
        new MaterialApp(
          routes:  {
            "/about_me": (context) =>
            new WebPage("Bm和弦的博客", "http://huang2177.github.io/"),
            "/about_app": (context) =>
            new WebPage("关于flutter", "http://flutter.link/"),
            "/code": (context) =>
            new WebPage("EasyRead", "https://github.com/huang2177/EasyRead"),

          },
          home: new ReadHubApp(),
          theme: readHubTheme,)
    );
}

