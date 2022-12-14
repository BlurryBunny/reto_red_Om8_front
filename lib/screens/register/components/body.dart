import 'package:flutter/material.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/constants.dart';
import 'package:reto_red_om8/screens/register/components/sign_up_form.dart';


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
                Text("Crear tu cuenta", style: headingStyle),
                const Text(
                  "Ingresa tu información \n o inicia sesión con Google",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                const SignUpForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                const Text("Regístrate", textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
