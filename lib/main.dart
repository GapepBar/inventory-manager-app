import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim_inventory_manager/Screens/orderApproveScreen.dart';
import 'package:gbim_inventory_manager/Screens/orderSuccessScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/homeppageScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/orderSettleScreen.dart';
import 'Screens/profileScreen.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
        routes: {
          '/homepage': (context) => HomepageScreen(),
          '/loginpage': (context) => LoginScreen(),
          '/profilepage': (context) => ProfileScreen(),
          '/orderApproveScreen': (context) => OrderApproveScreen(),
          '/orderSettleScreen': (context) => OrderSettleScreen(),
          '/orderSuccessScreen': (context) => OrderSuccessScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = (prefs.getString('userId'));

    if (userId != null) {
      return '/category';
    } else {
      return '/loginScreen';
    }
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: checkFirstSeen(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else {
    //         if (snapshot.data == '/loginScreen') {
    //           return const LoginScreen();
    //         } else {
    //           return CategoryScreen();
    //         }
    //       }
    //     });

    return HomepageScreen();
    // return LoginScreen();
  }
}
