import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MenuItem {
  const MenuItem({
    required this.text,
  });

  final String text;
}

class MenuItems {
  MenuItems({
    required this.items,
  });

  final List<MenuItem> items;

  static const home = MenuItem(text: 'Home');
  static const share = MenuItem(text: 'Share');
  static const settings = MenuItem(text: 'Settings');
  static const logout = MenuItem(text: 'Log Out');

  Widget buildItem(MenuItem item, {bool enabled = true}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.text,
            style: TextStyle(
              color: enabled ? blackColor : greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
