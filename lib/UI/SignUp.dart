import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
import 'package:flutter/gestures.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool flagImage = true;

  void setFlag() {
    setState(() {
      flagImage = !flagImage;
    });
    if (flagImage) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  bool _passwordVisible = false;

  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEDF1F9),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontFamily: 'Titillium Web',
                    color: Color(0xFF0D1F3C),
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          if (flagImage)
            Container(
              child: Image.asset('assets/image/office.png'),
              padding: EdgeInsets.only(top: 30),
            ),
          if (!flagImage)
            SizedBox(
              height: 20,
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
                      padding: const EdgeInsets.only(left: 24.0, right: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                child: TextField(
                                    onTap: setFlag,
                                    keyboardType: TextInputType.emailAddress,
                                    onEditingComplete: setFlag,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Titillium Web',
                                        color: Color(0xFF0D1F3C)),
                                    decoration: InputDecoration(
                                        labelText: 'First Name',
                                        contentPadding: EdgeInsets.zero,
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFFB5BBC9)))),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Center(
                                child: TextField(
                                    onTap: setFlag,
                                    keyboardType: TextInputType.emailAddress,
                                    onEditingComplete: setFlag,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Titillium Web',
                                        color: Color(0xFF0D1F3C)),
                                    decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        contentPadding: EdgeInsets.zero,
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFFB5BBC9)))),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Center(
                                child: TextField(
                                    onTap: setFlag,
                                    keyboardType: TextInputType.emailAddress,
                                    onEditingComplete: setFlag,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Titillium Web',
                                        color: Color(0xFF0D1F3C)),
                                    decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        contentPadding: EdgeInsets.zero,
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFFB5BBC9)))),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: TextField(
                                        onTap: setFlag,
                                        keyboardType: TextInputType.name,
                                        onEditingComplete: setFlag,
                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                            labelText: 'New password',
                                            contentPadding: EdgeInsets.zero,
                                            labelStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Titillium Web',
                                                color: Color(0xFFB5BBC9))),
                                        style: TextStyle(fontSize: 19),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(
                                          !_passwordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFFB5BBC9),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        width: 200, height: 50),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,Routes.CreatePin);
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                              fontFamily: 'Titillium Web',
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF347AF0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                        ))),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 16),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(
                                          color: Color(0xFF485068), fontSize: 15),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Login',
                                            style: TextStyle(
                                                color: Color(0xFF347AF0),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushNamed(context,Routes.Login);
                                              })
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}