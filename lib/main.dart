import 'package:flutter/material.dart';
import 'package:wallet/routing/route_generator.dart';
import 'package:wallet/UI/WelcomeScreen.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'dart:async';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterIconNetwork.instance!
      .init(host: "https://bicon.net.solidwallet.io/api/v3", isTestNet: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator().onGenerateRoute,
      home: WelcomeScreen(),
    );
  }
}

