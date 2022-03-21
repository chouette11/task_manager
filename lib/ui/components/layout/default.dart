import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/top/top_page.dart';


class DefaultLayout<T> extends StatelessWidget {
  const DefaultLayout({
    Key? key,
    required this.backgroundColor,
    required this.builder,
    required this.state,
    this.endDrawer,
    this.appBar,
  }) : super(key: key);
  final Color backgroundColor;
  final Widget Function(T) builder;
  final PreferredSizeWidget? appBar;
  final AsyncValue<T> state;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return state.when(
      data: (data) {
        return Scaffold(
          appBar: appBar != null ? appBar : null,
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                final FocusScopeNode currentScope = FocusScope.of(context);
                if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: builder(data),
            ),
          ),
          drawer: endDrawer,
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
