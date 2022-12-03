import 'package:flutter/material.dart';
import 'package:flutter_gql/video_info.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'video_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
