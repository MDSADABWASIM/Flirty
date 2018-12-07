import 'package:flutter/material.dart';


//builds and return card with title,image,desc
Widget _buildCircularImage(String image) {
  return new Container(
    margin: new EdgeInsets.symmetric(vertical: 27.0),
    alignment: FractionalOffset.centerLeft,
    width: 85.0,
    height: 85.0,
    decoration: new BoxDecoration(
      color: Colors.white,
      image: new DecorationImage(
        fit: BoxFit.fitWidth,
        image: new AssetImage(
          image,
        ),
      ),
      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black54,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}

Widget _cardElements(String title, String desc) {
  return new Container(
    margin: new EdgeInsets.fromLTRB(100.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      children: <Widget>[
        new Container(height: 4.0),
        new Text(
          title
        ),
        new Container(
          height: 10.0,
        ),
        Flexible(
          child: new Text(desc)),
      ],
    ),
  );
}

final _card = new Container(
  height: 150.0,
  margin: new EdgeInsets.only(left: 46.0),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(8.0),
    boxShadow: <BoxShadow>[
      new BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
      ),
    ],
  ),
);


//Use this class wherever you want to use this custom card and provide data in constructor.
class CardClass extends StatelessWidget {
  final String title, desc, image;

  CardClass(
      {Key key,
      @required this.title,
      @required this.desc,
      @required this.image,
     
      })
      : assert(title != null),
        assert(desc != null),
        assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardImage = _buildCircularImage(image);
    final cardElements = _cardElements(title, desc);
    return new GestureDetector(
      // onTap: () => Navigator.of(context).push(new PageRouteBuilder(
      //       pageBuilder: (_, __, ___) => //open your detail page
      //     )),
      child: new Container(
        height: 150.0,
        margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        child: new Stack(
          children: <Widget>[_card, cardImage, cardElements],
        ),
      ),
    );
  }
}