import 'package:get/get.dart';

import 'controller_Action.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerTV());
  }
}
