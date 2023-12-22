import 'package:get/get.dart';

import '../model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // 앱 초기에 서버에서 데이터를 가져오는 api 실행
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    var productData = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productName: 'Mouse'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productName: 'Keyboard'),
      Product(
        id: 3,
        price: 620,
        productDescription: 'some description about product',
        productName: 'Monitor',
      ),
      Product(
          id: 4,
          price: 80,
          productDescription: 'some description about product',
          productName: 'Ram'),
      Product(
        id: 5,
        price: 120.5,
        productDescription: 'some description about product',
        productName: 'Speaker',
      )
    ];
    products.assignAll(productData); // 현재 리스트안에 있는 값을 인자값으로 받게 하는 메소드
  }
}
