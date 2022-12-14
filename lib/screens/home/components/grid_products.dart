import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reto_red_om8/components/product_card.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/models/Product.dart';
import 'package:reto_red_om8/screens/home/components/section_title.dart';

class GridProducts extends StatelessWidget {
  final List<Product> products;
  const GridProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
      Padding(
              padding:EdgeInsets.all( getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Todos los productos", press: () {}),
      ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal:10.0),
         child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 310,
            ),
            itemCount: products.length,
            itemBuilder: (_, index) {
              return ProductCard(product: products[index]);
            },
          ),
       ),
     ],
   );
  }
}