import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/common/widgets/app_drawer/app_drawer.dart';
import 'package:news/screens/category/category_leyar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const CategoryLeyar(),
    );
  }
}
