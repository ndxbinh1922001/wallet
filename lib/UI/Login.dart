import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
import 'package:flutter/gestures.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            padding: EdgeInsets.only(top: 60),
            child: Center(
              child: Text(
                'Welcome Back!',
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
              child: Image.asset('assets/image/login(1).png'),
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
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: TextField(
                                onTap: setFlag,
                                onEditingComplete: setFlag,
                                decoration: InputDecoration(
                                  hintText: "Email address",
                                )),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Center(
                                  child: TextField(
                                    onTap: setFlag,
                                    onEditingComplete: setFlag,
                                    obscureText: !_passwordVisible,
                                    decoration:
                                    InputDecoration(hintText: "Password"),
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ),
                                Container(
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
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context,Routes.ForgotPassword);
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  fontSize: 15, fontFamily: 'Titillium Web'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Center(
                            child: ConstrainedBox(
                                constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,Routes.EnterPin);
                                    },
                                    child: Text(
                                      'Sign in',
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
                        Container(
                          padding: EdgeInsets.only(top: 16),
                          child: RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(
                                    color: Color(0xFF485068), fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign up',
                                      style: TextStyle(
                                          color: Color(0xFF347AF0),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushNamed(Routes.SignUp);
                                        })
                                ]),
                          ),
                        )
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