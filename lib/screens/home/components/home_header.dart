import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reto_red_om8/screens/cart/cart_screen.dart';
import 'package:reto_red_om8/screens/sign_in/sign_in_screen.dart';
import '../../../config_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';



class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/Log out.svg",
            press: (){ FirebaseAuth.instance.signOut(); Navigator.pushNamed(context, SignInScreen.routeNavigator);}
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            // press: () => Navigator.pushNamed(context, CartScreen.routeNavigator),
                        press: () => Navigator.pushNamed(context, CartScreen.routeNavigator),

          ),
        ],
      ),
    );
  }
}