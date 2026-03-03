import 'package:get/get.dart';

import '../controllers/collect_user_details_controller.dart';

class CollectUserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectUserDetailsController>(
      () => CollectUserDetailsController(),
    );
  }
}
