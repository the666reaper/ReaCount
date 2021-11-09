import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/Controller/home_page_managment.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class HomePageDelete extends GetView {
  const HomePageDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: const [
          Icon(Icons.remove_circle, color: Colors.red),
          Text('delete')
        ],
      ),
      content: const Text('Are you sure to delete this list ?'),
      actions: [cancel(), delete()],
    );
  }

  Widget delete() {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (DataController dataController) => TextButton(
          onPressed: HomePageManagement.delete(dataController),
          child: const Text('delete')),
    );
  }

  Widget cancel() {
    return TextButton(
        onPressed: HomePageManagement.cancel(), child: const Text('cancel'));
  }
}
