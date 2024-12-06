import 'package:flutter/material.dart';
import 'package:news/common/assets.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/screens/category/categ_card.dart';
import 'package:news/screens/category/models/categ_card_model.dart';

class CategoryLeyar extends StatelessWidget {
  static String routeName = 'Categories';
  final Function(String) onTap;
  const CategoryLeyar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<CategCardModel> cateCardsModels = [
      CategCardModel(
        id: '1',
        color: MyColors.sport,
        pic: Assets.ball,
        title: 'Sport',
      ),
      CategCardModel(
          id: '2',
          color: MyColors.politics,
          pic: Assets.politics,
          title: 'Politics'),
      CategCardModel(
          id: '3', color: MyColors.health, pic: Assets.health, title: 'Health'),
      CategCardModel(
          id: '4',
          color: MyColors.business,
          pic: Assets.bussiness,
          title: 'Business'),
      CategCardModel(
          id: '5',
          color: MyColors.environment,
          pic: Assets.environment,
          title: 'Environment'),
      CategCardModel(
          id: '6',
          color: MyColors.science,
          pic: Assets.science,
          title: 'Science'),
    ];

    return Padding(
      padding: const EdgeInsets.all(35.0),
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
              itemBuilder: (context, index) => CategCard(
                index: index,
                card: cateCardsModels[index],
                onTap: onTap,
              ),
              itemCount: cateCardsModels.length,
            ),
          )
        ],
      ),
    );
  }
}
