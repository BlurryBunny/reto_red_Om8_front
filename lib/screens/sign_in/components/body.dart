import 'package:flutter/material.dart';
import 'package:reto_red_om8/components/no_account_text.dart';
import 'package:reto_red_om8/screens/register/registration_screen.dart';
import 'package:reto_red_om8/screens/sign_in/components/sign_fom.dart';

import '../../../config_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Bienvenido nuevamente",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),

                const Text(
                  "Ingresa con tu correo electrónico y contraseña",
                  textAlign: TextAlign.center,
                ),
                  SizedBox(height: SizeConfig.screenHeight * 0.2),
                const SignForm(),
                
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
