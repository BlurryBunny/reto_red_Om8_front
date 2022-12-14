import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/models/Cart.dart';
import 'package:reto_red_om8/models/Product.dart';
import 'package:reto_red_om8/services/api_fake_store_service.dart';

import '../../../models/cartUpdate.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ApiFakeStoreService get service => GetIt.instance<ApiFakeStoreService>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
            future: service.getCart('1'),
            builder: (_, AsyncSnapshot<CartUpdate> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final CartUpdate products = snapshot.data!;
              final jsonProduct = products.toJson();
              return ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FutureBuilder(
                          future: service.getProduct(1),
                          // service.getProduct(snapshot.data!.products[0]),
                          builder: (_, AsyncSnapshot<Product?> snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }

                            final Product product_from_cart = snapshot.data!;
                            final Cart product_card_data = Cart(
                                product: product_from_cart,
                                numOfItem: jsonProduct['products'][index][1]
                                    .toDouble());
                            return Dismissible(
                              key: Key(product_from_cart.id.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(() {
                                  demoCarts.removeAt(index);
                                });
                              },
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset("assets/icons/Trash.svg"),
                                  ],
                                ),
                              ),
                              child: CartCard(productCard: product_card_data),
                            );
                          })));
            }));
  }
}
