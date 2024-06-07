import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewsapp/backend/fetchnews.dart';
import 'package:technewsapp/utils/colors.dart';

class Search_bar extends StatefulWidget {
  static TextEditingController serach_controller =
      TextEditingController(text: '');
  const Search_bar({Key? key}) : super(key: key);

  @override
  State<Search_bar> createState() => _Search_barState();
}

class _Search_barState extends State<Search_bar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: App_colors.dark_grey,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                controller: Search_bar.serach_controller,
                decoration: InputDecoration(
                    hintText: "Search a keyword or phrase",
                    hintStyle: GoogleFonts.lato(),
                    border: InputBorder.none),
              ))
            ],
          )),
        )),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetch_news();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: App_colors.dark_grey, shape: BoxShape.circle),
            child: Icon(Icons.search_rounded),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
