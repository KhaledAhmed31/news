import 'package:flutter/material.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            fit: BoxFit.fill,
            image: NetworkImage(article.urlToImage ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              article.source!.name ?? '',
              style: TextStyle(color: MyColors.grey, fontSize: 11),
            ),
          ),
          Text(
            article.description ?? '',
            style: TextStyle(
                color: MyColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              timeago.format(DateTime.parse(article.publishedAt!)),
              style: TextStyle(
                color: MyColors.grey,
                fontSize: 13,
              ),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
