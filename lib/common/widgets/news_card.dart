import 'package:flutter/material.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/screens/category/models/news_card_model.dart';
import 'package:timeago/timeago.dart' as timeago;


class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.model});
  final NewsCardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            fit: BoxFit.fill,
            image: AssetImage(model.posterPath),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              model.chanelName,
              style: TextStyle(color: MyColors.grey, fontSize: 11),
            ),
          ),
          Text(
            model.des,
            style: TextStyle(
                color: MyColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              timeago.format(model.publishDate) ,
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
