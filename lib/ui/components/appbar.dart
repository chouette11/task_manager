import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/main.dart';

class CustomAppbar extends ConsumerStatefulWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  ConsumerState<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends ConsumerState<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    var iconButtons = <Widget>[];
    final check = ref.watch(checkStateProvider.notifier);

    iconButtons = [
      Checkbox(
        value: check.state,
        onChanged: (value) {
          setState(() {});
          check.update((state) => value!);
        },
      )
    ];

    return AppBar(
      title: Text(widget.title),
      actions: iconButtons,
    );
  }
}
