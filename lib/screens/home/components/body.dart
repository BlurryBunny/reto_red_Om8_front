import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reto_red_om8/main.dart';
import 'package:reto_red_om8/models/Product.dart';
import 'package:reto_red_om8/screens/home/components/grid_products.dart';
import 'package:reto_red_om8/services/api_fake_store_service.dart';
import '../../../config_screen.dart';
import 'discount_banner.dart';
import 'categories.dart';
import 'home_header.dart';
import 'special_offers.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  ApiFakeStoreService get service => GetIt.instance<ApiFakeStoreService>();
  // ApiFakeStoreService get service -> GetIt.I<ApiFakeStoreService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
                future: service.getAllProducts(),
                builder: (_, AsyncSnapshot<List<Product>> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  final List<Product> products = snapshot.data ?? [];
                  return Column(
                    children: [
                      SizedBox(height: getProportionateScreenWidth(20)),
                      const HomeHeader(),
                      SizedBox(height: getProportionateScreenWidth(30)),
                      PopularProducts(products: products),
                      SizedBox(height: getProportionateScreenWidth(30)),
                      GridProducts(products: products),
                    ],
                  );
                }),
          )),
    );
  }
}
