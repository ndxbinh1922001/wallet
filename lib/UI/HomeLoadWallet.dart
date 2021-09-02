import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_icon_network/flutter_icon_network.dart';
import 'package:flutter/services.dart';
import 'package:wallet/UI/SendICX.dart';
import 'package:wallet/UI/QRScanPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
class HomeLoadWallet extends StatefulWidget {
  final String? _address;
  final String? _privateKey;

  const HomeLoadWallet(this._address, this._privateKey);

  _HomeLoadWalletState createState() => _HomeLoadWalletState();
}

class _HomeLoadWalletState extends State<HomeLoadWallet> {
  double _balance = 0.0;
  bool _show = false;//biến sử dụng để thay đổi mũi tên sang phải hoặc xuống dưới của button Send ICX
  String? destinationAddress;//biến lưu kết quả sau khi scan qrcode(địa chỉ muốn gửi ICX)
  void _getBalance() async {
    final balance = await FlutterIconNetwork.instance!
        .getIcxBalance(privateKey: widget._privateKey);
    setState(() {
      _balance = balance.icxBalance;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _getBalance();
  }

  void _setShow() {
    setState(() {
      _show = !_show;
    });
  }

  void _callWidgeSend() {
    String address = "${widget._address}";
    String privateKey = "${widget._privateKey}";
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SendICX(address, _balance, privateKey,null)));
  }
  void _callWidgeScan() async{
    String _result=await Navigator.of(context).push(MaterialPageRoute(
        builder:(context)=> QRScanPage()
    ));
    setState(() {
      destinationAddress=_result;
    });
    String address = "${widget._address}";
    String privateKey = "${widget._privateKey}";
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SendICX(address, _balance, privateKey,destinationAddress)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Color(0xFFF2F2F2),
          appBar: AppBar(
            backgroundColor: Color(0xFF7F77FE),
            bottom: const TabBar(
              tabs: [
                Tab(
                    iconMargin: EdgeInsets.only(bottom: 3),
                    icon: Icon(Icons.attach_money),
                    text: 'ICX balance'),
                Tab(
                    iconMargin: EdgeInsets.only(bottom: 3),
                    text: 'Transfer ICX',
                    icon: Icon(Icons.swap_horiz))
              ],
            ),
            title: Text(
              'My wallet',
              style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 5),
            ),
            centerTitle: true,
          ),
          body: TabBarView(children: [
            ListView(children: [

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(

                    height:100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(8.0, 8.0))],
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFB56FFF), Colors.lightBlue,Color(0xFFB56FFF),Colors.lightBlueAccent])),
                    child:Padding(
                      padding: const EdgeInsets.only(left:24,right:24),
                      child: Column(children:[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Text("Address",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontFamily: "SF Pro Display",
                                          color: Colors.white))),
                              Container(
                                  height: 25,
                                  child: Row(children: [
                                    Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Copy",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5)))),
                                    Container(
                                        child: IconButton(
                                            tooltip: "Copy address",
                                            color: Colors.white.withOpacity(0.8),
                                            onPressed: () {
                                              Clipboard.setData(
                                                  ClipboardData(text: "${widget._address}"));
                                              final snackBar = SnackBar(
                                                  content:
                                                  Text("Copied address"));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                            icon: Icon(Icons.content_copy)))
                                  ]))
                            ]),
                        Container(
                            child: Center(
                                child: Text("${widget._address}",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5))))),
                      ]),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(

                  height:100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(8.0, 8.0))],
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFB56FFF), Colors.lightBlue,Color(0xFFB56FFF),Colors.lightBlueAccent])),
                    child: Stack(children:[
                      Container(
                        padding: EdgeInsets.only(left: 24),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Balance: ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontFamily: "SF Pro Display"),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " ${_balance.toStringAsFixed(4)}",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Display",
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: ' TCX',
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Container(padding:EdgeInsets.only(right:10),alignment:Alignment.topRight,child:IconButton(onPressed: (){_getBalance();},icon:Icon(Icons.refresh_outlined,size:30,color:Colors.white)))
                    ]),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(

                    height:100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(8.0, 8.0))],
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFB56FFF), Colors.lightBlue,Color(0xFFB56FFF),Colors.lightBlueAccent])),
                    child:Column(mainAxisAlignment: MainAxisAlignment.center,children:[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 24),
                                alignment: Alignment.centerLeft,
                                child: Text("Private key: ",
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: "SF Pro Display",
                                        color: Colors.white))),
                            Container(
                                height: 25,
                                child: Row(children: [
                                  Container(
                                      child: Text("Copy",
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.5)))),
                                  Container(
                                      child: IconButton(
                                          tooltip: "Copy private key",
                                          color: Colors.white.withOpacity(0.8),
                                          onPressed: () {
                                            Clipboard.setData(
                                                ClipboardData(text: "b"));
                                            final snackBar = SnackBar(
                                                content:
                                                Text("Copied private key"));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          icon: Icon(Icons.content_copy)))
                                ]))
                          ]),
                      Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Center(
                              child: Text("${widget._privateKey}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5))))),
                    ])
                ),
              ),


            ]),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                Container(
                    height: 80,
                    child: Stack(children: [
                      Container(
                          decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30),boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(8.0, 8.0))
                          ]),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Container(width: 200,child:Row(children: [
                              Container(
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  child: CircleAvatar(
                                    child: Icon(Icons.send_to_mobile, size: 30),
                                  )),
                              Text("Send ICX",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.black)),
                            ],)),


                            Container(
                                child: Icon(
                                    !_show
                                        ? Icons.arrow_right
                                        : Icons.arrow_drop_down_outlined,
                                    size: 40),
                                alignment: Alignment.centerRight)
                          ])),
                      GestureDetector(
                        onTap: () {
                          _setShow();
                        },
                      )
                    ])),
                if (_show)
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                        child: Column(children: [
                          SizedBox(height: 10),
                          Container(
                            decoration:
                            BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30), boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(8.0, 8.0))
                            ]),
                            height: 70,
                            child: Stack(children: [
                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 5, top: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              child:
                                              Icon(Icons.account_balance_wallet)),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(height: 5),
                                                Text("Wallet address",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontFamily: "SF Pro Display")),
                                                Text(
                                                  "Enter an ICON address",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xFFB5BBC9)),
                                                ),
                                              ]),
                                          Icon(Icons.arrow_right, size: 40)
                                        ]),
                                  )),
                              GestureDetector(onTap: () {
                                _callWidgeSend();
                                _getBalance();
                              })
                            ]),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration:
                            BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30), boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(8.0, 8.0))
                            ]),
                            height: 70,
                            child: Stack(children: [
                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 5, top: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              child: Icon(Icons.qr_code_2_outlined)),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(height: 5),
                                                Text("QR code",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontFamily: "SF Pro Display")),
                                                Text(
                                                  "Scan an ICON address via a \nQR code",

                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xFFB5BBC9)),
                                                ),
                                              ]),
                                          Icon(Icons.arrow_right, size: 40)
                                        ]),
                                  )),
                              GestureDetector(onTap: () {
                                _callWidgeScan();
                              })
                            ]),
                          ),
                        ])),
                  ),
                SizedBox(
                  height: 36,
                ),
                Container(
                    height: 80,
                    child: Stack(children: [
                      Container(
                          decoration:
                          BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30), boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(8.0, 8.0))
                          ]),
                          child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                            Container(width: 250,child:Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 12, right: 12),
                                    child: CircleAvatar(
                                      child:
                                      Icon(Icons.center_focus_weak, size: 30),
                                    )),
                                Text("Receive ICX",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "SF Pro Display",
                                        color: Colors.black)),
                              ],
                            )),
                            Container(
                                child: Icon(Icons.arrow_right, size: 40),
                                alignment: Alignment.centerRight)
                          ])),
                      GestureDetector(
                        onTap: () {
                          Dialog errorDialog = Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0)), //this right here
                            child: Container(
                              height: 400.0,
                              width: 300.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 35.0),
                                    child: Text(
                                      'QR code',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                      child: QrImage(
                                        data: "${widget._address}",
                                        version: QrVersions.auto,
                                        size: 200.0,
                                      )),
                                  SizedBox(height: 20),
                                  TextButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text: "${widget._address}"));
                                        final snackBar = SnackBar(
                                            content: Text("Copied address"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text(
                                        'Copy address wallet',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 20.0),
                                      ))
                                ],
                              ),
                            ),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => errorDialog);
                        },
                      )
                    ])),
              ]),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/Begin', (route) => false);
            },
            child: Icon(Icons.logout),
          ),
        );
      }),
    );
  }
}