import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/components/appbar.dart';
import 'package:task_manager/ui/top/top_view_model.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topViewModelProvider);
    final viewModel = ref.watch(topViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return Scaffold(
          appBar: CustomAppbar(title: '',),
          body: Column(
            children: [
              data.page,

              BottomNavigationBar(
                onTap: (index) => viewModel.onChangedPage(index),
                fixedColor: Colors.orange,
                currentIndex: data.pageIndex,
                items: [
                  BottomNavigationBarItem(
                      label: "1日",
                      icon: Icon(Icons.ac_unit, color: Colors.orange)),
                  BottomNavigationBarItem(
                      label: "3日",
                      icon: Icon(Icons.ac_unit, color: Colors.orange)),
                  BottomNavigationBarItem(
                      label: "7日",
                      icon: Icon(Icons.ac_unit, color: Colors.orange,)),
                  BottomNavigationBarItem(
                      label: "一覧",
                      icon: Icon(Icons.ac_unit, color: Colors.orange,)),
                ],
              ),
            ],
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
