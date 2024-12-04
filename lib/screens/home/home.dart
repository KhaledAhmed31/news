import 'package:flutter/material.dart';
import 'package:news/common/widgets/app_drawer/app_drawer.dart';

class Home extends StatelessWidget {
  static String routeName = 'home';
  const Home({super.key});

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
    );
  }
}
