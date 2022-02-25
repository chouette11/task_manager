import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/ui/components/layout/default.dart';
import 'package:task_manager/ui/login/login_state.dart';
import 'package:task_manager/ui/login/login_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginViewModelProvider.notifier);
    final state = ref.watch(loginViewModelProvider);
    return DefaultLayout<LoginState>(
      state: state,
      backgroundColor: Colors.black,
      builder: (data) => Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await viewModel.login();
              context.go('/top');
            },
            child: Text("google"),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.login();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TopPage();
                },
              ),);
            },
            child: Text("ゲスト"),
          ),
        ],
      ),
    );
  }
}
