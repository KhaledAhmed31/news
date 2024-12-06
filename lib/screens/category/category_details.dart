import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/widgets/news_card.dart';
import 'package:news/screens/category/models/news_card_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, this.id});
  final String? id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedChanell = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                showCheckmark: false,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                selectedColor: Colors.green,
                onSelected: (value) {
                  selectedChanell = index;
                  setState(() {});
                },
                label: Text('chanell $index'),
                selected: index == selectedChanell,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                labelStyle: TextStyle(
                    color:
                        index == selectedChanell ? Colors.white : Colors.green),
              ),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) => NewsCard(
              model: NewsCardModel(
                  posterPath: "assets/NewsTest.png",
                  chanelName: 'BBC',
                  des:
                      "Why are football's biggest clubs starting a new ftournament?",
                  publishDate: DateTime.now())),
        )
      ],
    );
  }
}
