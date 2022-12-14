import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/screens/home/home_screen.dart';
import 'package:reto_red_om8/screens/sign_in/sign_in_screen.dart';

class AuthPage extends StatelessWidget {
  final String routeNavigator;
  const AuthPage({super.key, required this.routeNavigator});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return routeNavigator == '/signIn' ? const SignInScreen() : const HomeScreen();
  }
}