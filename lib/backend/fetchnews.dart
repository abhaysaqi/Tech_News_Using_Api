import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:technewsapp/components/searchbar.dart';
import 'package:technewsapp/utils/api_key.dart';

Future<List> fetch_news() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=" +
          Api.API_KEY +
          "&q=" +
          Search_bar.serach_controller.text));
  Map result = jsonDecode(response.body);
  print("fetched");
  print(result);
  return result['articles'];
}
