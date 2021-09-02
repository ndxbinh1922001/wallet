import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
class CheckYourEmail extends StatefulWidget {
  @override
  _CheckYourEmailState createState() => _CheckYourEmailState();
}

class _CheckYourEmailState extends State<CheckYourEmail> {
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
                      'Check Your Email',
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
                'Follow a password recovery instructions we have just sent to your email address ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Titillium Web',
                    color: Color(0xFF485068))),
          ),
          Expanded(child: Image.asset('assets/image/email.png')),
          Container(
            padding: EdgeInsets.only(bottom: 50, top: 60),
            child: Center(
              child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200, height: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context,Routes.NewPassword);
                      },
                      child: Text(
                        'Back to Login',
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
    );
  }
}