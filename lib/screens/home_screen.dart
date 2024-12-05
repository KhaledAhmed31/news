import 'package:flutter/material.dart';
import 'package:news/common/widgets/app_drawer/app_drawer.dart';
import 'package:news/screens/category/category_leyar.dart';
import 'package:news/screens/settings/settings_leyar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layer = CategoryLeyar.routeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(onTap: (p0) {
        setState(() {
          layer = p0;
          Navigator.pop(context);
        });
      }),
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: layer==CategoryLeyar.routeName? const CategoryLeyar():const Settings(),
    );
  }
}
