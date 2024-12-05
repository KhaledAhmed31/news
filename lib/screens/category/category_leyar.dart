import 'package:flutter/material.dart';
import 'package:news/common/assets.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/screens/category/categ_card.dart';
import 'package:news/screens/category/categ_card_model.dart';

class CategoryLeyar extends StatelessWidget {
  static String routeName = 'Categories';

  const CategoryLeyar({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategCardModel> cateCardsModels = [
      CategCardModel(
        color: MyColors.sport,
        pic: Assets.ball,
        title: 'Sport',
      ),
      CategCardModel(
          color: MyColors.politics, pic: Assets.politics, title: 'Politics'),
      CategCardModel(
          color: MyColors.health, pic: Assets.health, title: 'Health'),
      CategCardModel(
          color: MyColors.business, pic: Assets.bussiness, title: 'Business'),
      CategCardModel(
          color: MyColors.environment,
          pic: Assets.environment,
          title: 'Environment'),
      CategCardModel(
          color: MyColors.science, pic: Assets.science, title: 'Science'),
    ];

    return Container(
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          Assets.pattern,
        ),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 29),
            child: Text(
              "Pick your categort \nof interest",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color(0xff4F5A69), fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 148 / 171),
              itemBuilder: (context, index) =>
                  CategCard(index: index, card: cateCardsModels[index]),
              itemCount: cateCardsModels.length,
            ),
          )
        ],
      ),
    );
  }
}
