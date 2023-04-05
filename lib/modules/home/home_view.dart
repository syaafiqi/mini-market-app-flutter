import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_market_app/models/product_model.dart';
import 'package:mini_market_app/modules/home/home_controller.dart';
import 'package:mini_market_app/themes/app_text_theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    filterBottomSheet(),
                    enableDrag: false,
                  );
                },
                child: Icon(
                  controller.isSetFilter
                      ? Icons.filter_alt
                      : Icons.filter_alt_outlined,
                  size: 26.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/cart");
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                ),
              ),
            ),
          ],
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // On tap
                        },
                        child: productItemCard(controller.products[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
      ),
    );
  }

  Widget productItemCard(ProductModel product) => Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail ?? "",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: robotoRegular(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.brand,
                      style: robotoRegular(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Stock: ${product.stock}',
                      style: robotoRegular(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price}',
                      style: robotoRegular(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        product.isOnCart
                            ? ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => states.contains(
                                                  MaterialState.disabled)
                                              ? Colors.grey.shade600
                                              : Colors.red.shade900),
                                  // overlayColor: MaterialStateProperty.all<Color>(kiMadaniDisabledColor),
                                ),
                                onPressed: () {
                                  controller.removeFromCart(product);
                                },
                                child: const Text('Remove from Cart'),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  controller.addToCart(product);
                                },
                                child: const Text('Add to Cart'),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget filterBottomSheet() => Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${controller.minPrice.value.toInt()}'),
                  Text('\$${controller.maxPrice.value.toInt()}'),
                ],
              ),
              RangeSlider(
                values: RangeValues(
                    controller.minPrice.value, controller.maxPrice.value),
                min: 0.0,
                max: 1000.0,
                onChanged: (RangeValues values) {
                  controller.onPriceSliderChanged(values.start, values.end);
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.disabled)
                                ? Colors.grey.shade600
                                : Colors.red.shade900),
                      ),
                      onPressed: () {
                        controller.onResetFilter();
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 6.0,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Reset",
                          style: robotoRegular(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.disabled)
                                ? Colors.grey.shade600
                                : Colors.blue),
                      ),
                      onPressed: () {
                        controller.onSetFilter();
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 6.0,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Set Filter",
                          style: robotoRegular(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
