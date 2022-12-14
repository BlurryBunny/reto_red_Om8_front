import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget{
  static String routeNavigator = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}