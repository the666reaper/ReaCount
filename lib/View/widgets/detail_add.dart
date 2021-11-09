import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class DetailAdd extends StatefulWidget {
  const DetailAdd({Key? key}) : super(key: key);

  @override
  _DetailAddState createState() => _DetailAddState();
}

class _DetailAddState extends State<DetailAdd> {
  TextEditingController count = TextEditingController();
  TextEditingController description = TextEditingController();
  String type = '\$';

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (context) => GetBuilder<DataController>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: count,
                  maxLines: 1,
                  onChanged: (value) {
                    count.text = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'you need to add a number';
                    }
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add number...',
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
