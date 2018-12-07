import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  final String title, desc, link, image, imageUrl;

  DetailPage({this.title, this.desc, this.image, this.link, this.imageUrl});


  Container _getBackground() {
    return new Container(
      height: 250.0,
      child: FadeInImage(
        placeholder: AssetImage("lib/asset/image/f.png"),
        image: NetworkImage(imageUrl),
        fit: BoxFit.fitHeight,
      ),
      constraints: new BoxConstraints.expand(height: 270.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _raisedButton(String url) {
    return new Positioned(
      left: 180.0,
      right: 5.0,
      bottom: 20.0,
      child: new RaisedButton(
        elevation: 10.0,
        color: new Color(0xFF6400df),
        splashColor: Colors.orange,
        shape: BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        onPressed: () {
         //do anything
        },
        child: new Text(
          "Take Course",
          style: new TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _flatButton(BuildContext context) {
    return new Positioned(
      left: 5.0,
      right: 190.0,
      bottom: 20.0,
      child: new RaisedButton(
        elevation: 10.0,
        shape: BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: new Color(0xFF6400df),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Text(
          "Go back",
          style: new TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  final separator = new Container(
      margin: new EdgeInsets.symmetric(vertical: 8.0),
      height: 2.0,
      width: 50.0,
      color: new Color(0xff00c6ff));

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new Container(
          height: 100.0,
          margin: new EdgeInsets.only(top: 180.0),
          child: Image.asset(image),
        ),
        SingleChildScrollView(
          scrollDirection:Axis.vertical ,
                  child: new Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  title.toUpperCase(),
                  
                ),
                separator,
                new Padding(
                  padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
                  child:  new Text(desc),
                ),
               
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String _url = link;
    return new Scaffold(
      
      body: new Container(
        color: new Color(0xFF736AB7),
        constraints: BoxConstraints.expand(),
        child: new Stack(
          
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _raisedButton(_url),
            _flatButton(context),
          ],
        ),
        padding: EdgeInsets.only(bottom: 40.0),
      ),
     
    );
  }
}