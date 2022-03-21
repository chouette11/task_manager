import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:task_manager/ui/components/appbar.dart';
import 'package:task_manager/ui/components/drawer/drawer.dart';
import 'package:task_manager/ui/components/layout/default.dart';
import 'package:task_manager/ui/setting/setting_state.dart';
import 'package:task_manager/ui/setting/setting_view_model.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingViewModelProvider);
    final viewModel = ref.watch(settingViewModelProvider.notifier);
    return DefaultLayout<SettingState>(
        state: state,
        endDrawer: CustomDrawer(),
        appBar: CustomAppbar(title: 'a'),
        backgroundColor: Colors.blueAccent,
        builder: (data) {
          return Column(
            children: [
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {},
              ),
            ],
          );
        }
    );
  }
}
