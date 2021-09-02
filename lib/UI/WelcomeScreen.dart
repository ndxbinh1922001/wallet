import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wallet/routing/routes.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF347AF0),
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 120),
                    child: Center(
                      child: Image.asset('assets/image/logo.png'),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Image.asset('assets/image/Welcome to WHOLLET.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 200),
                  child: Center(
                    child: ConstrainedBox(
                        constraints:
                        BoxConstraints.tightFor(width: 200, height: 50),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,Routes.Login);
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: 'Titillium Web',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF347AF0)),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context,Routes.SignUp);}
                                )
                        ]),
                  ),
                )
              ],
            )
          ],
        ));
  }
}