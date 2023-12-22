import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controller/shopping_controller.dart';

import '../controller/cart.controller.dart';

class Shopping extends StatelessWidget {
  Shopping({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              // column위젯에서 listview를 불러오려면 expanded로 감싸줘야 정상출력
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(controller
                                          .products[index].productDescription),
                                    ],
                                  ),
                                  Text(
                                    '${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToItem(controller.products[index]);
                                  },
                                  child: const Text('Add to Cart')),
                            ],
                          ),
                        ),
                      );
                    }));
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total price: ${controller.totalprice}',
                style: const TextStyle(fontSize: 25, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 90,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.counted.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            );
          }),
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          backgroundColor: Colors.black87,
        ));
  }
}
