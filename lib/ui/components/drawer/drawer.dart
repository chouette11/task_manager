import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'drawer_view_model.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(drawerViewModelProvider);

    return Drawer(
      child: Container(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text(
                "a"
              ),
              onTap: () => context.push('/setting'),
            ),
          ],
        ),
      ),
    );
  }
}
