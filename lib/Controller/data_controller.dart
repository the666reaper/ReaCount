import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:reacount_2/Model/local_data.dart/data.dart';
import 'package:reacount_2/Model/repository/local_data_repository.dart';

class DataController extends GetxController {
  late int index;
  List<Data> data = [];
  void setIndex(i) {
    index = i;
    update();
  }

  LocalDataRepository repository = LocalDataRepository();
  DataController() {
    update();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    data = repository.dataList;
    super.update(ids, condition);
  }

  create(String name, String type) {
    repository.createData({'name': name, 'count': 0, 'type': type});
    update();
  }

  updaTe(String name, String type) {
    repository.editData(index, name: name, type: type);
    update();
  }

  delete() {
    repository.deleteData(index);
    update();
  }

  createDetail(index, double count, String type, String description) {
    repository.createDetail(index, {
      'count': count,
      'description': description,
      'type': type,
      'time': Jiffy(DateTime.now()).format('hh:mm'),
      'date': Jiffy(DateTime.now()).format('dd MM yyyy')
    });
    update();
  }

  deleteDetail(index, detailIndex) {
    repository.deleteDetail(index, detailIndex);
    update();
  }
}
