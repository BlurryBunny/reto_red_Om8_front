import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config_screen.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String? error}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
          child: SvgPicture.asset(
            "assets/icons/error-svgrepo-com.svg",
            height: getProportionateScreenHeight(15),
            width: getProportionateScreenWidth(15),
          ),
        ),
        Text(error ?? ""),
      ],
    );
  }
}
