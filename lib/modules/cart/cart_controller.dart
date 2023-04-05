import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mini_market_app/common/storage/realm.dart';
import 'package:mini_market_app/models/cart_model.dart';
import 'package:mini_market_app/models/realm/cart.dart';

class CartController extends GetxController {
  List<CartModel> products = [];
  double total = 0;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var realm = RealmInstance.open();
    products = realm
        .all<Cart>()
        .map((e) => CartModel(
              id: e.id,
              title: e.title,
              description: e.description,
              price: e.price,
              qty: e.qty,
              brand: e.brand,
              category: e.category,
              thumbnail: e.thumbnail,
              rating: e.rating,
              discountPercentage: e.discountPercentage,
            ))
        .toList();
    total = products.map((e) => e.qty * e.price).sum;
    realm.close();
    update();
  }

  void updateQty(int id, int qty) {
    var realm = RealmInstance.open();
    var item = realm.find<Cart>(id);
    if (item != null) {
      realm.write(() {
        if (qty == 0) {
          realm.delete(item);
        } else {
          item.qty = qty;
        }
      });
    }
    realm.close();
    fetchProducts();
  }

  void removeFromCart(int id) {
    var realm = RealmInstance.open();
    var item = realm.find<Cart>(id);
    if (item != null) {
      realm.write(() {
        realm.delete(item);
      });
    }

    realm.close();
    fetchProducts();
  }
}
