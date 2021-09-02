import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEDF1F9),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontFamily: 'Titillium Web',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D1F3C)),
                    )),
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  alignment: Alignment.topLeft,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 80),
            child: Text(
                'Enter your registrated email address to receive password reset instruction',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Titillium Web',
                    color: Color(0xFF485068))),
          ),
          Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Email address",
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                            child: ConstrainedBox(
                                constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,Routes.CheckYourEmail);
                                    },
                                    child: Text(
                                      'Reset Password',
                                      style: TextStyle(
                                          fontFamily: 'Titillium Web',
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF347AF0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}