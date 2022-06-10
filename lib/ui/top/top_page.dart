import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_manager/ui/add_task/add_task_page.dart';
import 'package:task_manager/ui/components/drawer/drawer.dart';
import 'package:task_manager/ui/components/drawer/drawer_button.dart';
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
          theme: ThemeData(
            primaryColor: HexColor("F06A30"),
            primarySwatch: Colors.orange,
          ),
          home: DefaultTabController(
            length: 3,
            child: SafeArea(
              child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) => viewModel.onChangedPage(index),
                  fixedColor: Colors.orange,
                  currentIndex: data.pageIndex,
                  items: [
                    BottomNavigationBarItem(
                      label: "タスク",
                      icon: Icon(Icons.ac_unit, color: Colors.orange),
                    ),
                    BottomNavigationBarItem(
                      label: "一覧",
                      icon: Icon(Icons.ac_unit, color: Colors.orange),
                    ),
                    BottomNavigationBarItem(
                      label: "設定",
                      icon: Icon(Icons.ac_unit, color: Colors.orange),
                    ),
                  ],
                ),
                drawer: CustomDrawer(),
                body: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          DrawerButton(context: context),
                          Text("aa")
                        ],
                      ),

                      Container(height: 580,child: data.page),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AddTaskPage(),
                  ),
                ),
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
