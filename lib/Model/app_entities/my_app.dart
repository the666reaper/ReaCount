// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/pages/home_page.dart';
import 'package:reacount_2/model/app_entities/page_routes.dart';

class MyApp extends GetView {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRouts.routes,
      home: HomePage(),
    );
  }
}
