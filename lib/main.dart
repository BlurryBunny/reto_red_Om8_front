import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reto_red_om8/auth_page.dart';
import 'package:reto_red_om8/config_screen.dart';
import 'package:reto_red_om8/firebase_options.dart';
import 'package:reto_red_om8/screens/home/home_screen.dart';
import 'package:reto_red_om8/screens/sign_in/sign_in_screen.dart';
import 'package:reto_red_om8/services/api_fake_store_service.dart';
import './routes.dart';
import './config_theme.dart';

final api_service = GetIt.instance; // sl is short for service locator
void initGetIt() {
  api_service.registerLazySingleton<ApiFakeStoreService>(() => ApiFakeStoreService());
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initGetIt();
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String routeNavigator = SignInScreen.routeNavigator;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reto Red Om8',
      theme: theme(),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              routeNavigator = HomeScreen.routeNavigator;
            } else {
              routeNavigator = SignInScreen.routeNavigator;
            }
            return AuthPage(routeNavigator: routeNavigator);
          },
        ),
      ),

      initialRoute: routeNavigator,
      routes: routes,


    );
  }
}

