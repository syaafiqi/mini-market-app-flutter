import 'package:get/get.dart';
import 'package:mini_market_app/modules/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
