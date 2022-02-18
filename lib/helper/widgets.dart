import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';

Widget MyAppBar() {
  return AppBar(
    // leading: Icon(Icons.menu, color: Colors.black),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu_open_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 0.0, 50.0, 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Quick",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
