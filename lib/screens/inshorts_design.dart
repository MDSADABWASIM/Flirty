import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InshortsHomePage extends StatefulWidget {
  @override
  InshortsHomePageState createState() {
    return new InshortsHomePageState();
  }
}

class InshortsHomePageState extends State<InshortsHomePage> {
 
  Widget size(double height) {
    return SizedBox(height: height);
  }

//  for making custom CircleAvatar
  Widget avatar(IconData icon, String name) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            backgroundColor: Colors.orangeAccent,
            radius: 30.0,
          ),
          size(10.0),
          Text(name),
        ],
      ),
    );
  }

  ///custom cards
  Widget card(String image, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  // Container(width: 100.0, color: Colors.white, height: 30.0),
                  Text(text)
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.blue,
              blurRadius: 3.0,
              offset: new Offset(0.0, 3.0),
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        height: 150.0,
        width: 100.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Flash'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('categories'),
                size(10.0),
                Container(
                  height: 3.0,
                  color: Colors.blue,
                  width: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      avatar(Icons.mobile_screen_share, 'Tech news'),
                      SizedBox(
                        width: 15.0,
                      ),
                      avatar(Icons.trending_up, 'Trending'),
                      SizedBox(
                        width: 15.0,
                      ),
                      avatar(Icons.book, 'Editorials')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Topics'),
                size(10.0),
                Container(
                  height: 3.0,
                  color: Colors.blue,
                  width: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Wrap(
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      card('assets/images/world.jpg', 'International'),
                      card('assets/images/news.jpg', 'Breaking news'),
                      card('assets/images/sports.jpg', 'Sports'),
                      card("assets/images/india.jpeg", 'India'),
                      card('assets/images/bollywood.jpeg', 'Bollywood'),
                      card('assets/images/education.jpeg', 'Education'),
                      card('assets/images/entertainment.jpg', 'Entertainment'),
                      card('assets/images/tech.jpeg', 'Tech'),
                      card('assets/images/holly.jpg', 'Hollywood')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
