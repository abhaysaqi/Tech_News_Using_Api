import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewsapp/components/bottom_sheet.dart';
import 'package:technewsapp/utils/colors.dart';
import 'package:technewsapp/utils/text.dart';

class News_box extends StatelessWidget {
  final String image_url, title, time, description, url;
  const News_box(
      {Key? key,
      required this.image_url,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            show_my_bottom_sheet(context, title, description, image_url, url);
          },
          child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 5, left: 5, right: 5),
            color: App_colors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: image_url,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                    );
                  },
                  placeholder: (context, url) {
                    return CircularProgressIndicator(
                      color: App_colors.primary,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Icon(Icons.error);
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Modified_text(
                        text: title, size: 16, color: App_colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    Modified_text(
                        text: time, size: 12, color: App_colors.light_white)
                  ],
                ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Divider(color: App_colors.light_white),
        ),
      ],
    );
  }
}
