import 'package:flutter/material.dart';
import 'package:news/common/assets.dart';

class Settings extends StatefulWidget {
  static String routeName = 'Settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            Assets.pattern,
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  )),
              child: DropdownButton(
                value: 1,
                isExpanded: true,
                underline: const SizedBox(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                iconEnabledColor: Colors.green,
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Arabic'),
                  ),
                  DropdownMenuItem(
                    value: 0,
                    child: Text('English'),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ));
  }
}
