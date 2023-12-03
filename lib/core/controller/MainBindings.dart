
import 'package:get/get.dart';
import 'package:harca/core/controller/AppDataController.dart';


class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<AppDataController>(AppDataController());
  }

}
