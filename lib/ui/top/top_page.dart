import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/add_task/add_task_page.dart';
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
        return MaterialApp(
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: CustomAppbar(title: "aa"),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) => viewModel.onChangedPage(index),
                fixedColor: Colors.orange,
                currentIndex: data.pageIndex,
                items: [
                  BottomNavigationBarItem(
                    label: "1日",
                    icon: Icon(Icons.ac_unit, color: Colors.orange),
                  ),
                  BottomNavigationBarItem(
                    label: "3日",
                    icon: Icon(Icons.ac_unit, color: Colors.orange),
                  ),
                  BottomNavigationBarItem(
                    label: "7日",
                    icon: Icon(Icons.ac_unit, color: Colors.orange),
                  ),
                  BottomNavigationBarItem(
                    label: "一覧",
                    icon: Icon(Icons.ac_unit, color: Colors.orange),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  data.page,
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      child: Icon(Icons.add, size: 28),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AddTaskPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
