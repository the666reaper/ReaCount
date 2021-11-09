import 'package:reacount_2/Model/local_data.dart/data.dart';
import 'package:reacount_2/Model/local_data.dart/sqflite.dart';

class LocalDataRepository {
  List<Data> dataList = [];

  int id = 0;

  LocalDataRepository() {
    readData();
  }

  createData(Map dataMap) async {
    await Sqflite.insertToDataBaseData(dataMap['name'], dataMap['type']);
    await readData();
  }

  readData() async {
    List<Map> list = await Sqflite.getDataBaseData();
    for (var i = 0; i < list.length; i++) {
      dataList.add(Data(data: list[i]));
    }
  }

  editData(index, {name, type}) async {
    await dataList[index].edit(name: name, type: type);
    await readData();
  }

  deleteData(index) async {
    await Sqflite.deleteData(dataList[index].data['id']);
    await readData();
  }

  createDetail(index, Map detail) async {
    await dataList[index].addToList(detail['count'], detail['description'],
        detail['type'], detail['time'], detail['data']);
  }

  deleteDetail(index, detailIndex) async {
    await dataList[index].removeFromList(detailIndex);
  }
}
