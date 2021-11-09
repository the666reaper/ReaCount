// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/widgets/detail_list.dart';
import 'package:reacount_2/View/widgets/home_app_bar.dart';

class DetailPage extends GetView {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.DetailAppBar,
      body: DetailList(),
    );
  }
}
