import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
  bool _passwordVisible1 = false;

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
                      'Create New Password',
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
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 40),
            child: Text(
                'Your new password must be different from a previously used password',
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
                                    style: TextStyle(fontSize: 25),
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: Stack(
                              children: [
                                Center(
                                  child: TextField(
                                    onTap: setFlag,
                                    keyboardType: TextInputType.name,
                                    onEditingComplete: setFlag,
                                    obscureText: !_passwordVisible1,
                                    decoration: InputDecoration(
                                        labelText: 'Repeat password',
                                        contentPadding: EdgeInsets.zero,
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFFB5BBC9))),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible1 = !_passwordVisible1;
                                      });
                                    },
                                    icon: Icon(
                                      !_passwordVisible1
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFFB5BBC9),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(
                            child: ConstrainedBox(
                                constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                                    },
                                    child: Text(
                                      'Submit',
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