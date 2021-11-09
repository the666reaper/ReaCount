// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class DetailListTile extends StatelessWidget {
  final index;

  const DetailListTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (DataController dataController) {
      return (dataController.data[dataController.index].list[index]['count'] >
              0)
          ? add(index: index)
          : substract(index: index);
    });
  }

  static Widget add({required index}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: secondListTile(
          color: Colors.lightGreen, index: index, align: Alignment.centerRight),
    );
  }

  static Widget substract({required index}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: secondListTile(
          color: Colors.redAccent,
          index: index,
          align: Alignment.centerLeft,
        ));
  }
}

class secondListTile extends StatelessWidget {
  final Color color;
  final Alignment align;
  final int index;
  const secondListTile(
      {Key? key, required this.index, required this.color, required this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (DataController dataController) {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 1),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: align,
          width: double.infinity,
          // ignore: prefer_const_literals_to_create_immutables
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  dataController.data[dataController.index].list[index]
                          ['count'] +
                      dataController.data[dataController.index].list[index]
                          ['type'],
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.start,
                ),
                Text(
                  dataController.data[dataController.index].list[index]['time'],
                  style: const TextStyle(color: Colors.indigo),
                ),
                if (dataController.data[dataController.index].list[index]
                        ['description'] !=
                    '')
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      dataController.data[dataController.index].list[index]
                          ['description'],
                      textAlign: TextAlign.start,
                    ),
                  )
              ],
            ),
          ));
    });
  }
}
