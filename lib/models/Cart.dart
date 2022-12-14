import 'package:reto_red_om8/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});

  Map<String, dynamic> toJson() => {
        'products': product,
        'numOfItem': numOfItem,
      };

  factory Cart.fromJson(Map<String, dynamic> data) {
    return Cart(numOfItem: data['numberOfItem'], product: data['product']);
  }
  
}

// Demo data for our Cart

List<Cart> demoCarts = [
  // Cart(product: demoProducts[0], numOfItem: 2),
  // Cart(product: demoProducts[1], numOfItem: 1),
  // Cart(product: demoProducts[3], numOfItem: 1),
];
