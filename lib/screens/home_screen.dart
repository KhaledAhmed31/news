import 'package:flutter/material.dart';
import 'package:news/common/assets.dart';
import 'package:news/common/widgets/app_drawer/app_drawer.dart';
import 'package:news/screens/category/category_details.dart';
import 'package:news/screens/category/category_leyar.dart';
import 'package:news/screens/settings/settings_leyar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layer = CategoryLeyar.routeName;
  String? catId;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          Assets.pattern,
        ),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: AppDrawer(onTap: (p0) {
          setState(() {
            layer = p0;
            catId = null;
            Navigator.pop(context);
          });
        }),
        appBar: AppBar(
          title: Text(
            'News App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: layer == CategoryLeyar.routeName
            ? catId == null
                ? CategoryLeyar(
                    onTap: (p0) {
                      catId = p0;
                      setState(() {});
                    },
                  )
                : CategoryDetails(id: catId)
            : const Settings(),
      ),
    );
  }
}
