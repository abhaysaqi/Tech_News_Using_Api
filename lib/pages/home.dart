import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:technewsapp/backend/fetchnews.dart';
import 'package:technewsapp/components/news_box.dart';
import 'package:technewsapp/components/searchbar.dart';
import 'package:technewsapp/utils/colors.dart';
import 'package:technewsapp/utils/constants.dart';
import 'package:technewsapp/utils/text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // news = fetch_news();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: App_colors.bg_color,
      appBar: AppBar(
          elevation: 0,
          title: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bold_text(text: "Tech", size: 20, color: App_colors.primary),
                Modified_text(
                    text: "News", size: 20, color: App_colors.light_white)
              ],
            ),
          ),
          centerTitle: true),
      body: Column(
        children: [
          Search_bar(),
          Expanded(
              child: Container(
            width: w,
            child: FutureBuilder(
                future: fetch_news(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return News_box(
                            image_url: snapshot.data![index]['urlToImage'] ??
                                Image_url.Image_not_found,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description: snapshot.data![index]['description'],
                            url: snapshot.data![index]['url']);
                      },
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error.toString() + "fetch unsuccessfull");
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: App_colors.bg_color,
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }
}
