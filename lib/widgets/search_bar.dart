import 'package:flutter/material.dart';
import 'package:news/common/my_colors.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key, required this.searching});
  bool searching;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      cursorColor: MyColors.prim,
      decoration: InputDecoration(
        hoverColor: Colors.green,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
             widget.searching = false;
            });
          },
          icon: Icon(Icons.close, color: MyColors.prim),
        ),
        suffixIcon: Icon(Icons.search, color: MyColors.prim),
        hintText: "Search Article",
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 86, 194, 111),
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
