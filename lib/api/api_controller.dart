import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/api/api_setting.dart';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;

class ApiController {
  Future<List<News>> getNews(String category) async {
    var response = await http.get(Uri.parse(ApiSetting.getNewsByCategory(category)));
    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body);
        var jsonArray = jsonResponse['articles'] as List;
        return jsonArray.map((e) => News.fromJson(e)).toList();
      } catch (e) {
        Get.snackbar("error", e.toString(), margin: EdgeInsets.all(10));
      }
    }
    return [];
  }
}
