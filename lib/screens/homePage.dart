import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//The home of our app, shows craousal, and list of categories

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Padding _topPadding = new Padding(padding: EdgeInsets.only(top: 5.0));

  ///creating a carousel using carousel pro library.
  final myCraousal = Carousel(
    dotSize: 5.0,
    autoplayDuration: const Duration(seconds: 6),
    dotIncreaseSize: 2.0,
    borderRadius: true,
    radius: Radius.circular(5.0),
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(seconds: 1),
    images: [
      AssetImage('assets/images/card1.png'),
      AssetImage('assets/images/card3.png'),
      AssetImage('assets/images/card4.png'),
      AssetImage('assets/images/card2.png'),
    ],
  );

//our appbar defined here.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      backgroundColor: Color(0xfffbdd00),
      title: new Text("Home page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      centerTitle: true,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.dashboard),
          // onPressed: () => _navigateTo(context, Category())
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
        backgroundColor: Colors.grey[100],
        key: _scaffoldKey,
        appBar: _buildAppBar(context),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: width / 3,
              height: height / 3,
              child: myCraousal,
            ),
            SizedBox(height: 20.0),
            _categoryHeadlines(),
            _listTileForCategory(context, Icons.face, 'Facebook Jobs',
                'Like, Share, Follow work'),
            _topPadding,
            _listTileForCategory(context, Icons.slideshow, 'Youtube Jobs',
                'Subscribe, Share work'),
            _topPadding,
            _listTileForCategory(context, Icons.message, 'Twitter Jobs',
                'Follow, Retweet, Like work'),
            _topPadding,
            _listTileForCategory(context, Icons.portrait, 'LinkedIn Jobs',
                'Follow, Share, Like work'),
            _topPadding,
            _listTileForCategory(
                context, Icons.computer, 'Other Jobs', 'More online work'),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent jobs',
                        style:
                            TextStyle(color: Colors.black54, fontSize: 15.0)),
                    GestureDetector(
                        // onTap: () => _navigateTo(context, RecentJobs()),
                        child: Text('view all',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 15.0))),
                  ]),
            )
          ],
        ));
  }

//for a small headline in top of categories.
  Widget _categoryHeadlines() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Top categories',
            style: TextStyle(color: Colors.black54, fontSize: 15.0)),
        GestureDetector(
            // onTap: () => _navigateTo(context, Category()),
            child: Text('view all',
                style: TextStyle(color: Colors.blueAccent, fontSize: 15.0))),
      ]),
    );
  }

//for building our category listTile.
  _listTileForCategory(
      BuildContext context, IconData icon, String name, String subtitle) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        backgroundColor: Color(0xFFEA7773),
        child: Icon(icon, color: Colors.white),
      ),
      subtitle: Text(subtitle),
      // onTap: () => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => CategoryJobs(name))),
    );
  }

 
}
