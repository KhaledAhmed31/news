import 'package:flutter/material.dart';
import 'package:news/common/assets.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/widgets/app_drawer/app_drawer.dart';
import 'package:news/screens/category/category_details.dart';
import 'package:news/screens/category/category_leyar.dart';
import 'package:news/models/categ_card_model.dart';
import 'package:news/screens/settings/settings_leyar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layer = CategoryLeyar.routeName;
  CategCardModel? subCat;
  bool searching = false;
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
        backgroundColor: const Color.fromARGB(0, 75, 216, 91),
        drawer: searching
            ? null
            : AppDrawer(onTap: (p0) {
                setState(() {
                  layer = p0;
                  subCat = null;
                  Navigator.pop(context);
                });
              }),
        appBar: searching
            ? AppBar(
                leadingWidth: 0,
                title: SizedBox(
                  height: 50,
                  width: 340,
                  child: TextField(
                    enableInteractiveSelection: true,
                    cursorColor: MyColors.prim,
                    decoration: InputDecoration(
                      hoverColor: Colors.green,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searching = false;
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
                  ),
                ),
              )
            : AppBar(
                leadingWidth: 70,
                actions: subCat == null
                    ? null
                    : [
                        IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                searching = true;
                              });
                            },
                            icon: const Icon(Icons.search))
                      ],
                title: layer == CategoryLeyar.routeName
                    ? subCat == null
                        ? Text(
                            'News App',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : Text(subCat!.title,
                            style: Theme.of(context).textTheme.titleLarge)
                    : Text('Settings',
                        style: Theme.of(context).textTheme.titleLarge),
              ),
        body: layer == CategoryLeyar.routeName
            ? subCat == null
                ? CategoryLeyar(
                    onTap: (p0) {
                      subCat = p0;
                      setState(() {});
                    },
                  )
                : CategoryDetails(id: subCat!.id)
            : const Settings(),
      ),
    );
  }
}
