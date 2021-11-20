// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/pages/detail_page.dart';
import 'package:reacount_2/View/widgets/home_add_edit.dart';
import 'package:reacount_2/View/widgets/home_delete.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class HomeTile extends GetView {
  final int index;
  const HomeTile(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (DataController dataController) {
        return FocusedMenuHolder(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                title: Text(dataController.data[index].data['name']),
                trailing: Text(
                    '${dataController.data[index].data['count']}${dataController.data[index].data['type']}'),
              ),
            ),
            onPressed: () {
              dataController.setIndex(index);
              Get.to(() => DetailPage());
            },
            menuItems: editeDelete(dataController));
      },
    );
  }

  List<FocusedMenuItem> editeDelete(DataController dataController) {
    return [
      FocusedMenuItem(
          title: Text('edit'),
          onPressed: () {
            HomePageAddOrEdit(isEditing: true);
          }),
      FocusedMenuItem(
          title: Text('delete'),
          onPressed: () {
            Get.dialog(HomePageDelete());
          })
    ];
  }
}
