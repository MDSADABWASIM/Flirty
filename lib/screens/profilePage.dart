import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
A minimalistic profile page.
*/

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '', country = '', city = '', phoneNumber = '';
  int walletBalance, threshold;
  bool female = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffF0DF87),
      appBar: _buildAppBar(),
      body: _profile(),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Color(0xfffbdd00),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text('Edit',
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
            onPressed: () {},
          ),
        ]);
  }

  _profile() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        SizedBox(height: 15.0),
        CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.redAccent,
          child: female
              ? Image.asset('assets/images/femaleUser.png', fit: BoxFit.contain)
              : Image.asset(
                  'assets/images/maleUser.png',
                  fit: BoxFit.contain,
                ),
        ),
        SizedBox(height: 25.0),
        Center(child: Text('$name')),
        SizedBox(height: 25.0),
        SizedBox(width: 10.0),
        _profileItems('Mobile number', '$phoneNumber'),
        SizedBox(height: 15.0),
        SizedBox(width: 10.0),
        _profileItems('City', city),
        SizedBox(height: 15.0),
        SizedBox(width: 10.0),
        _profileItems('Country', country),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text('Id: '),
          Text('userId'),
          FlatButton(
              child: Text('Copy'), onPressed: () => _copyToClipboard('userId')),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text('Wallet balance: '),
          SizedBox(width: 10.0),
          Text(
            walletBalance.toString() + '  ₹',
            style: TextStyle(color: Colors.green, fontSize: 17.0),
          )
        ]),
        SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text('Threshold for payment: '),
          SizedBox(width: 10.0),
          Text(
            threshold.toString() + '  ₹',
            style: TextStyle(color: Colors.green, fontSize: 17.0),
          )
        ]),
        SizedBox(height: 25.0),
        RaisedButton(
            color: Color(0xff75DA8B),
            child: Text('Payment Request'),
            onPressed: () {})
      ]),
    );
  }

//for creating profile items titles and details.
  _profileItems(String title, String desc) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Text(title + ": "),
      Text(desc),
    ]);
  }

  _copyToClipboard(String copy) {
    Clipboard.setData(new ClipboardData(text: copy));
  }
}
