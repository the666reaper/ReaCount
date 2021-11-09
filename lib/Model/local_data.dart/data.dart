import 'package:reacount_2/Model/local_data.dart/sqflite.dart';

class Data {
  Map data;
  List<Map> list = [];
  Data({required this.data}) {
    readList();
  }

  addToList(count,description,type,time,date) async {
    await Sqflite.insertToDataBaseDetail(data['id'], count,
        description, type, time, date);
    await readList();
  }

  removeFromList(int index) {
    Sqflite.deleteDetail(list[index]['detailsid']);
    readList();
  }

  readList() async {
    list = await Sqflite.getDataBaseDetail(data['id']);
    editCount();
  }

  edit({name, type}) {
    data['name'] = name;
    data['type'] = type;
    Sqflite.editData(id: data['id'], name: name, type: type);
  }

  editCount() {
    double count = 0.0;
    for (var i = 0; i < list.length; i++) {
      count += list[i]['count'];
    }
    Sqflite.editCount(data['id'], count);
  }
}
