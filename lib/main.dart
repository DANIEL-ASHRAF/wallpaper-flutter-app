import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/home_view.dart';

import 'helper/constants/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: normalMode,
      home: HomeView(),
    );
  }
}