import 'package:flutter/material.dart';
import 'package:news/widgets/chanells_list.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  String? selectedSource;
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChanellsList(
        categoryId: widget.id,      
      ),
    );
  }
}
