import 'package:flutter/material.dart';
import 'package:technewsapp/utils/text.dart';

class Bottom_sheet_image extends StatelessWidget {
  final String imageurl, title;
  const Bottom_sheet_image(
      {Key? key, required this.imageurl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(
                      imageurl,
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 300,
                child: Bold_text(text: title, size: 18, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
