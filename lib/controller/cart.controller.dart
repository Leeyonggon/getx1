import 'package:get/get.dart';
import 'package:shopping_getx/model/product.dart';

class CartController extends GetxController {
  var cart = <Product>[].obs;
  double get totalprice => cart.fold(
      0,
      (e, item) =>
          e +
          item.price); // for in loop로 리스트의 합을 구할 수 있지만 .fold(initialvalue값에 => ?? 값을 계속 더해서 하나의 총합으로 만들어줌)를 이용해 간단하게 구현
  // get => 을 사용하면 cart리스트가 초기화 된 후에 값을 가져 올 수 있게 함 read only
  //getter 는 class의 private 변수 값을 리턴하도록 할 수 있고 setter는 받은 파라미터를 class에 호출

  int get counted => cart.length;

  void addToItem(Product p) {
    cart.add(p);
  }
}
