import 'package:news/models/chanel_cat_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    articles = json["articles"] == null
        ? null
        : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
  }
}

class Article {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Sources.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}
