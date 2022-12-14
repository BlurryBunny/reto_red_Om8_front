import 'package:flutter/material.dart';
import 'package:reto_red_om8/screens/register/registration_screen.dart';

import '../constants.dart';
import '../config_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes una cuenta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: (() => Navigator.pushNamed(context, RegistrationScreen.routeNavigator)),
          child: Text(
            "¡Regístrate!",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16), color: kprimaryColor),
          ),
        ),
      ],
    );
  }
}
