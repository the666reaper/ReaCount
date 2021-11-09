import 'package:get/get.dart';
import 'package:reacount_2/Controller/data_controller.dart';

class HomePageManagement {
  static saveOrEdit(isEditing, DataController dataController, String type, name,
      description) {
    (isEditing)
        ? dataController.updaTe(name.text, type)
        : dataController.create(name.text, type);
  }

  static cancel() {
    Get.back();
  }

  static delete(DataController controller) {
    controller.delete();
  }
}
