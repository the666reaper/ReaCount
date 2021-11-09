import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/Controller/data_controller.dart';
import 'package:reacount_2/View/widgets/detail_tile.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (DataController dataController) => ListView.builder(
        itemCount: dataController.data[dataController.index].list.length,
        itemBuilder: (context, index) => DetailListTile(index: index),
      ),
    );
  }
}
