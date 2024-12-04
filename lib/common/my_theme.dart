import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTheme {
  static ThemeData them = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.prim),
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          actionsIconTheme: const IconThemeData(size: 35, color: Colors.white),
          iconTheme: const IconThemeData(size: 35, color: Colors.white),
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: MyColors.prim,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)))));
}
