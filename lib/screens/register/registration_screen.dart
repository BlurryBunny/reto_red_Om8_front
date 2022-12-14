import 'package:flutter/material.dart';
import 'components/body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  static String routeNavigator = '/registration';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registrarse"),
                leading: const SizedBox(),

      ),
      body: const Body(),
    );
  }
}