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
            new WebPage("about me", "http://github.io/huang2177"),
            "/about_app": (context) =>
            new WebPage("about flutter", "http://flutter.link/"),
            "/code": (context) =>
            new WebPage("github", "https://github.com/huang2177/EasyRead"),

          },
          home: new ReadHubApp(),
          theme: readHubTheme,)
    );
}

