import 'package:get/get.dart';
import 'package:mini_market_app/modules/cart/cart_binding.dart';
import 'package:mini_market_app/modules/cart/cart_view.dart';
import 'package:mini_market_app/modules/home/home_binding.dart';
import 'package:mini_market_app/modules/home/home_view.dart';
import 'package:mini_market_app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
  ];
}
