import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'dart:async';
import 'package:wallet/UI/HomeLoadWallet.dart';
class Begin extends StatefulWidget {
  BeginState createState() => BeginState();
}

class BeginState extends State<Begin> {
  String? addressWallet;
  String? privateKey;
  var _enterPrivateKey = TextEditingController();//biến lưu private key để load wallet

  void _getWalletByPrivateKey() async {
    final wallet = await FlutterIconNetwork.instance!
        .getWalletByPrivateKey(_enterPrivateKey.text);
    setState(() {
      privateKey = wallet?['private_key'];
      addressWallet = wallet?['address'];
    });
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
        builder: (context) => HomeLoadWallet(addressWallet, privateKey)),(route)=>false);
  }

  void _createWallet() async {
    final wallet = await FlutterIconNetwork.instance!.createWallet;
    setState(() {
      _enterPrivateKey.text = wallet.privateKey!;
    });
    _getWalletByPrivateKey();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        color: Colors.white,
        child: Stack(
            children:[
              Scaffold(floatingActionButton:FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/Login', (route) => false);
                },
                child: Icon(Icons.logout),
              ),
                floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              ),
              Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/image/Vector 6.png')),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/image/Vector 5.png')),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/image/Vector 7.png')),
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: Stack(
                          children: [
                            Center(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Image.asset(
                                    'assets/image/HeroMobile.png',
                                  ),
                                )),
                            Container(color: Colors.white.withOpacity(0.2)),
                            Container(
                                padding: EdgeInsets.only(left: 24, right: 24),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'MyWallet is the most comprehensive wallet in the ICON eco-system.Swipe through to see what\'s possible',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Titillium Web',
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      wordSpacing: 3),
                                ))
                          ],
                        ),
                        alignment: Alignment.topCenter,
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(width: 200, height: 50),
                            child: ElevatedButton(
                                onPressed: () {
                                  _createWallet();
                                },
                                child: Text(
                                  'Create new wallet',
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
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        alignment: Alignment.topCenter,
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an wallet?',
                              style:
                              TextStyle(color: Color(0xFF485068), fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Load wallet',
                                    style: TextStyle(
                                        color: Color(0xFF347AF0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Dialog errorDialog = Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  12.0)), //this right here
                                          child: Container(
                                            height: 300.0,
                                            width: 300.0,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 35.0),
                                                  child: Text(
                                                    'Enter private key:',
                                                    style: TextStyle(
                                                        color: Colors.purple,
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                                Container(
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border(
                                                          top: BorderSide(
                                                              width: 1,
                                                              color: Colors.black12,
                                                              style:
                                                              BorderStyle.solid),
                                                          bottom: BorderSide(
                                                              width: 1,
                                                              color: Colors.black12,
                                                              style: BorderStyle
                                                                  .solid))),
                                                  child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 25, right: 25),
                                                      child: TextField(
                                                        controller: _enterPrivateKey,
                                                        minLines: 3,
                                                        maxLines: 3,
                                                        keyboardType: TextInputType
                                                            .streetAddress,
                                                        decoration: InputDecoration(
                                                          hintText:
                                                          "Ex:00e1d6541bfd8be7d88be0d24516556a34ab477788022fa07b4a6c1d862c4de516",
                                                          border: InputBorder.none,
                                                          focusedBorder:
                                                          InputBorder.none,
                                                          enabledBorder:
                                                          InputBorder.none,
                                                          errorBorder:
                                                          InputBorder.none,
                                                          disabledBorder:
                                                          InputBorder.none,
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(height: 20),
                                                TextButton(
                                                    onPressed: () {
                                                      _getWalletByPrivateKey();
                                                    },
                                                    child: Text(
                                                      'Load Wallet',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20.0),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                            errorDialog);
                                      })
                              ]),
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                              alignment: Alignment.bottomRight,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/image/Vector 3.png')),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/image/Vector 8.png')),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/image/Vector 9.png')),
                        ],
                      ))
                ],
              ),

            ]
        ));
  }
}