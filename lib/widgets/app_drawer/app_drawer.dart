import 'package:flutter/material.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/widgets/app_drawer/drawer_item.dart';
import 'package:news/screens/category/category_leyar.dart';
import 'package:news/screens/settings/settings_leyar.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.onTap});
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 140,
            color: MyColors.prim,
            child: Text(
              "News App!",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          DrawerItem(ontap: onTap,
              icon: Icons.list,
              title: Text(
                CategoryLeyar.routeName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          DrawerItem(ontap: onTap,
              icon: Icons.settings,
              title: Text(
                Settings.routeName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
