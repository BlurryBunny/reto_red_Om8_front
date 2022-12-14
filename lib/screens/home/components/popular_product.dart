import 'package:flutter/material.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../config_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> products;
  const PopularProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Productos populares", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  if (products[index].price < 75.0) {
                    return ProductCard(product: products[index]);
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
