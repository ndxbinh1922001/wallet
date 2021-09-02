import 'package:flutter/material.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SendICX extends StatefulWidget {
  final double _balance;
  final String _walletAdress;//địa chỉ của wallet
  final String _walletPrivateKey;//private key của wallet
  final String? _distinationAddress;// địa chỉ wallet muốn gửi được truyền từ screen scan qrcode sang
  const SendICX( this._walletAdress, this._balance, this._walletPrivateKey,this._distinationAddress);

  SendICXState createState() => SendICXState();
}

class SendICXState extends State<SendICX> {
  String? result=null;
  var _textAddress = TextEditingController();//biến dùng để lưu địa chỉ wallet muốn gửi mà người dùng nhập vào
  var _value = TextEditingController();//biến lưu giá trị icx sẽ gửi
  void _sendIcx() async {
    final response = await FlutterIconNetwork.instance!.sendIcx(
        yourPrivateKey: widget._walletPrivateKey,
        destinationAddress: _textAddress.text,
        value: _value.text);
    setState(() {
      result = response.txHash;
    });
  }

  void _getBalance() async {
    final balance = await FlutterIconNetwork.instance!
        .getIcxBalance(privateKey: widget._walletPrivateKey);
    setState(() {
      a = balance.icxBalance;
    });
  }
  void setNull(){
    setState(() {
      result=null;
    });
  }
  double a = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      (widget._distinationAddress==null)? _textAddress.text="Enter address ":_textAddress.text="${widget._distinationAddress}";
      a = widget._balance;
    });
  }
  bool show=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: AppBar(
          leading:
          IconButton(onPressed: () {Navigator.of(context).pop(result);}, icon: Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: Text('Send',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        body: ListView(children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10, left: 20, top: 15),
              child: Text("Destination address",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "SF Pro Display"))),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.black12,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        width: 1,
                        color: Colors.black12,
                        style: BorderStyle.solid))),
            child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _textAddress,
                  minLines: 2,
                  maxLines: 2,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "hx4d37a7013c14bedeedbe131c72e97ab337aea159",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _textAddress.clear();
                      },
                    ),
                    disabledBorder: InputBorder.none,
                  ),
                )),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10, left: 20, top: 15),
              child: Text("Wallet address",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "SF Pro Display"))),
          Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Colors.black12,
                          style: BorderStyle.solid),
                      bottom: BorderSide(
                          width: 1,
                          color: Colors.black12,
                          style: BorderStyle.solid))),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10, left: 20, top: 15),
              child: Text(widget._walletAdress,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "SF Pro Display"))),
          Container(
              height: 60,
              child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: '$a ',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "ICX available",
                            style: TextStyle(fontSize: 15, color: Colors.black))
                      ],
                    ),
                  ))),
          Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Colors.black12,
                          style: BorderStyle.solid),
                      bottom: BorderSide(
                          width: 1,
                          color: Colors.black12,
                          style: BorderStyle.solid))),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Center(
                      child: Text("Sending",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                  Center(
                      child: Container(
                          width: 100,
                          child: TextField(
                              controller: _value,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 35),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "0.0")))),
                  Container(
                      child: Text("ICX",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)))
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200, height: 50),
                  child:
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          show=!show;
                        });
                        _sendIcx();
                        String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(DateTime.now());
                        Future.delayed(const Duration(seconds: 5), () {setState(() {show=!show;});
                        _getBalance();
                        Dialog errorDialog = Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                              height: 350.0,
                              width: 300.0,
                              child:(result!=null)?
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Icon(Icons.check,
                                          size: 60, color: Colors.green)),
                                  Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 20.0),
                                      child: Text("Success",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Source address: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("${widget._walletAdress} ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Destination address: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("${_textAddress.text} ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("ICX: ${_value.text}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Time: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text(formattedDate ,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  TextButton(onPressed: (){setNull();Navigator.pop(context, false);},child: Text("Back"),)
                                ],
                              ):
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Icon(Icons.cancel_outlined,
                                          size: 60, color: Colors.red)),
                                  Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 20.0),
                                      child: Text("Fail",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red))),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Source address: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("${widget._walletAdress} ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Destination address: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text("${_textAddress.text} ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("ICX: ${_value.text}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top:10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Time: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right:20),
                                    alignment: Alignment.centerLeft,
                                    child: Text(formattedDate ,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ),
                                  TextButton(onPressed: (){setNull();Navigator.pop(context, false);},child: Text("Back"),)

                                ],
                              )

                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => errorDialog);});
                      },
                      child:(show==false)? Text(
                        'Send',
                        style: TextStyle(
                            fontFamily: 'Titillium Web',
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ):Center(child: CircularProgressIndicator(),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF347AF0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ))),
            ),
          ),

        ]));
  }
}