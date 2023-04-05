import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_market_app/apis/products_api.dart';
import 'package:mini_market_app/common/storage/realm.dart';
import 'package:mini_market_app/models/product_model.dart';
import 'package:mini_market_app/models/realm/cart.dart';

class HomeController extends GetxController {
  ProductApi productApi = ProductApi();
  List<ProductModel> products = [];
  bool isLoading = true;

  bool isSetFilter = false;
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = 1000.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    products = [];
    isLoading = true;
    update();

    var realm = RealmInstance.open();
    var response = await productApi.getProducts();
    if (response != null) {
      response['products'].forEach((data) {
        var product = ProductModel.fromJson(data);
        if (realm.find<Cart>(product.id) != null) {
          product.isOnCart = true;
        }
        products.add(product);
      });
      if (isSetFilter) {
        products = products
            .where((element) =>
                element.price >= minPrice.value &&
                element.price <= maxPrice.value)
            .toList();
      }
      realm.close();
      isLoading = false;
      update();
    }
  }

  void onPriceSliderChanged(double minValue, double maxValue) {
    minPrice.value = minValue;
    maxPrice.value = maxValue;
  }

  void onSetFilter() {
    isSetFilter = true;
    fetchProducts();
  }

  void onResetFilter() {
    isSetFilter = false;
    minPrice.value = 0.0;
    maxPrice.value = 1000;
    fetchProducts();
  }

  void addToCart(ProductModel product) {
    var realm = RealmInstance.open();
    realm.write(() {
      realm.add<Cart>(Cart(
        product.id,
        product.title,
        product.description,
        product.price,
        1,
        product.brand,
        product.category,
        discountPercentage: product.discountPercentage,
        rating: product.rating,
        thumbnail: product.thumbnail,
      ));
    });

    realm.close();

    products[products.indexOf(product)].isOnCart = true;
    update();
  }

  void removeFromCart(ProductModel product) {
    var realm = RealmInstance.open();
    var item = realm.find<Cart>(product.id);
    if (item != null) {
      realm.write(() => realm.delete(item));
    }

    realm.close();

    products[products.indexOf(product)].isOnCart = false;
    update();
  }
}
