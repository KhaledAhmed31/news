import 'package:flutter/material.dart';
import 'package:news/screens/category/models/categ_card_model.dart';

class CategCard extends StatelessWidget {
  const CategCard({super.key, required this.index, required this.card, required this.onTap});
  final int index;
  final CategCardModel card;
  final Function (String) onTap;
  

  @override
  Widget build(BuildContext context) {
    bool right = index % 2 != 0;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      overlayColor: WidgetStatePropertyAll(card.color..withOpacity(.5)),
      onTap: ()=>onTap(card.id),
      child: Container(
        decoration: BoxDecoration(
            color: card.color,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomRight: right ? const Radius.circular(20) : Radius.zero,
                bottomLeft: !right ? const Radius.circular(20) : Radius.zero)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              card.pic,
              fit: BoxFit.contain,
            ),
            Text(
              card.title,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
