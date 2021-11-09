import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/widgets/home_tile.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (DataController dataController) {
        return ListView.builder(
          itemCount: dataController.data.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeTile(index);
          },
        );
      },
    );
  }
}
