import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(Icons.menu));
  }
}
