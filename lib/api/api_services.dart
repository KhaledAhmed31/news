import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/api/api_string.dart';
import 'package:news/models/chanel_cat_model.dart';
import 'package:news/models/news_model.dart';

class ApiServices {
  static Future<ChanelsModel> getSource(String id) async {
    var url = Uri.https(ApiString.baseURL, ApiString.sourceEndPoint,
        {'apikey': ApiString.apiKey, 'category': id});
    Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return ChanelsModel.fromJson(json);
  }

  static Future<NewsModel> getNews(String? sourceId) async {
    var url = Uri.https(ApiString.baseURL, ApiString.newsEndPoint,
        {'apikey': ApiString.apiKey, 'sources': sourceId});
    Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }
}
