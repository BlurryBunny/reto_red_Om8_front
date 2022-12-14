import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static String routeNavigator = '/signIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inicia sesión'),
        leading: const SizedBox(),
      ),
      body: const Body(),
    );
  }
}
