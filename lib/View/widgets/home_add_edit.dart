import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/Controller/home_page_managment.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class HomePageAddOrEdit extends StatefulWidget {
  final bool isEditing;
  const HomePageAddOrEdit({Key? key, required this.isEditing})
      : super(key: key);

  @override
  _HomePageAddOrEditState createState() => _HomePageAddOrEditState();
}

class _HomePageAddOrEditState extends State<HomePageAddOrEdit> {
  String type = '';
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const Text('Name:'),
            TextFormField(
              controller: name,
              maxLength: 10,
              maxLines: 1,
              onChanged: (value) {
                name.text = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'add name here...',
              ),
            ),
            const Text('Description'),
            TextFormField(
              controller: description,
              onChanged: (value) {
                description.text = value;
              },
              maxLength: 10,
              maxLines: 1,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'add description here...',
              ),
            ),
            const Text('Initial type:'),
            // ignore: todo
            //TODO:add Types to app
            Row(children:[save(widget.isEditing), cancel()],)
          ],
        );
  }

  Widget save(bool isEditing) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (DataController dataController) => TextButton(
          onPressed: HomePageManagement.saveOrEdit(
              isEditing, dataController, type, name, description),
          child: Text((isEditing) ? 'edit' : 'add')),
    );
  }

  Widget cancel() {
    return TextButton(
        onPressed: HomePageManagement.cancel(), child: const Text('cancel'));
  }
}
