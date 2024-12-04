import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.title});
  final IconData icon;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 29, 29, 29), width: 1))),
      child: ListTile(
        leading: Icon(
          icon,
          size: 35,
          color: Colors.black,
        ),
        title: title,
      ),
    );
  }
}
