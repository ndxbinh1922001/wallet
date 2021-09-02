import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
import 'package:wallet/UI/WelcomeScreen.dart';
import 'package:wallet/UI/Login.dart';
import 'package:wallet/UI/SignUp.dart';
import 'package:wallet/UI/CreatePin.dart';
import 'package:wallet/UI/CreatePinConfirm.dart';
import 'package:wallet/UI/ForgotPassword.dart';
import 'package:wallet/UI/CheckYourEmail.dart';
import 'package:wallet/UI/NewPassword.dart';
import 'package:wallet/UI/EnterPin.dart';
import 'package:wallet/UI/Begin.dart';
class RouteGenerator {
  static RouteGenerator? _instance;

  RouteGenerator._();

  factory RouteGenerator() {
    _instance ??= RouteGenerator._();
    return _instance!;
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.WelcomeScreen :
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.Login:
        return MaterialPageRoute(builder: (_) => Login());
      case Routes.SignUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case Routes.CreatePin:
        return MaterialPageRoute(builder: (_) => CreatePin());
      case Routes.CreatePinConfirm:
        return MaterialPageRoute(builder: (_) => CreatePinConfirm());
      case Routes.ForgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case Routes.CheckYourEmail:
        return MaterialPageRoute(builder: (_) => CheckYourEmail());
      case Routes.NewPassword:
        return MaterialPageRoute(builder: (_) => NewPassword());
      case Routes.EnterPin:
        return MaterialPageRoute(builder: (_) => EnterPin());
      case Routes.Begin:
        return MaterialPageRoute(builder: (_) => Begin());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}