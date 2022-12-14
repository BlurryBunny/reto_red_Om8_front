import 'package:flutter/material.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/models/Product.dart';

import '../../../constants.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: Image.network(widget.product.image!),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        
      ],
    );
  }
 
}
