import 'package:flutter/material.dart';
import 'package:wallet/routing/routes.dart';

class CreatePinConfirm extends StatefulWidget {
  @override
  _CreatePinConfirmState createState() => _CreatePinConfirmState();
}

class _CreatePinConfirmState extends State<CreatePinConfirm> {
  int _count = 0;

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
                      'Confirm PIN',
                      style: TextStyle(
                          fontFamily: 'Titillium Web',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D1F3C)),
                    )),
                Container(
                  child: IconButton(
                    onPressed: () {Navigator.of(context).pop();},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  alignment: Alignment.topLeft,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Text('Repeat a PIN code to continue ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Titillium Web',
                    color: Color(0xFF485068))),
          ),
          if (_count == 0)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                  ],
                ),
              ),
            ),
          if (_count == 1)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                  ],
                ),
              ),
            ),
          if (_count == 2)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                  ],
                ),
              ),
            ),
          if (_count == 3)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval(1).png')),
                  ],
                ),
              ),
            ),
          if (_count == 4)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/image/Oval.png')),
                  ],
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '\.',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontFamily: 'Titillium Web',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF003282)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count++;
                                if (_count == 4)
                                  Navigator.pushNamedAndRemoveUntil(context,Routes.Login, (route) => false);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    size: 35,
                                    color: Color(0xFF003282),
                                  ))),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _count--;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}