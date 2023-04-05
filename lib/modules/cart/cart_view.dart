import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_market_app/models/cart_model.dart';
import 'package:mini_market_app/modules/cart/cart_controller.dart';
import 'package:mini_market_app/themes/app_text_theme.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.products.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: cartItemCard(controller.products[index]));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          ),
        ),
        bottomNavigationBar: Container(
          height: 80.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${controller.total}',
                style: robotoRegular(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                child: const Text('Checkout'),
                onPressed: () {
                  // TODO: implement checkout functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cartItemCard(CartModel product) => Card(
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
                      '\$${product.price * product.qty}',
                      style: robotoRegular(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                controller.updateQty(
                                  product.id,
                                  product.qty - 1,
                                );
                              },
                            ),
                            Text(
                              product.qty.toString(),
                              style: robotoRegular(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                controller.updateQty(
                                  product.id,
                                  product.qty + 1,
                                );
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            controller.removeFromCart(product.id);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
