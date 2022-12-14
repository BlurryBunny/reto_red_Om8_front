import 'package:flutter/cupertino.dart';
import 'package:reto_red_om8/screens/Cart/Cart_screen.dart';
import 'package:reto_red_om8/screens/details/details_screen.dart';
import 'package:reto_red_om8/screens/home/home_screen.dart';
import 'package:reto_red_om8/screens/register/registration_screen.dart';
import 'package:reto_red_om8/screens/sign_in/sign_in_screen.dart';

final Map<String,WidgetBuilder> routes =  {
  SignInScreen.routeNavigator:(context) => const SignInScreen(),
  RegistrationScreen.routeNavigator:(context) => const RegistrationScreen(),
  HomeScreen.routeNavigator:(context) => const HomeScreen(),
  DetailsScreen.routeNavigator:(context) => const DetailsScreen(),
  CartScreen.routeNavigator:(context) => const CartScreen(),
  
};