import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewsapp/components/bottom_sheet_image.dart';
import 'package:technewsapp/utils/colors.dart';
import 'package:technewsapp/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void show_my_bottom_sheet(
    BuildContext context, String title, description, image_url, url) {
  showBottomSheet(
    backgroundColor: App_colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    elevation: 20,
    context: context,
    builder: (context) {
      return My_bottom_sheet_layout(
          title: title,
          description: description,
          imageurl: image_url,
          url: url);
    },
  );
}

launch_url(String url) async {
  if (await canLaunch(url)) {
    await launch_url(url);
  } else {
    throw "could not launch $url";
  }
}

class My_bottom_sheet_layout extends StatelessWidget {
  final String title, description, imageurl, url;
  My_bottom_sheet_layout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottom_sheet_image(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child:
                Modified_text(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Read full article",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch_url(url);
                    },
                  style: GoogleFonts.lato(color: Colors.blue.shade400))
            ])),
          )
        ],
      ),
    );
  }
}
