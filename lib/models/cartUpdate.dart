// ignore: file_names
import 'package:reto_red_om8/components/product_card.dart';

class CartUpdate {
  int? id;
  int userId;
  DateTime date;
  // List<Map<String, dynamic>>? products;

  get length => null;
  List<ProductCard> products;

  CartUpdate(
      {this.id,
      required this.userId,
      required this.date,
      required this.products});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products,
    };
  }

  factory CartUpdate.fromJson(Map<String, dynamic> data) {
    return CartUpdate(
      id: data['id'],
      userId: data['userId'],
      date: DateTime.parse(data['date']),
      products: (data['products'] as List)
          .map((item) => item as ProductCard)
          .toList(),
    );
  }
}
