import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/firestore/firestore_tasks_stream.dart';
import 'package:task_manager/ui/top/components/task_card.dart';

class ViewTaskPage extends ConsumerWidget {
  const ViewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksStreamProvider);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: [
                Tab(text: "期限前"),
                Tab(text: "期限切れ"),
                Tab(text: "期限なし"),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 136,
            child: tasks.when(
              data: (data) {
                final taskData = data;
                List<Widget> before = [];
                List<Widget> after = [];
                List<Widget> no = [];

                taskData.forEach((element) {
                  var now = DateTime.now();
                  if (element.isLimit == false) {
                    no.add(TaskCard(taskData: element));
                  } else if (now.isAfter(element.limit)) {
                    after.add(TaskCard(taskData: element));
                  } else if (now.isBefore(element.limit)) {
                    before.add(TaskCard(taskData: element));
                  }
                });

                return TabBarView(
                  children: [
                    ListView(children: before),
                    ListView(children: after),
                    ListView(children: no),
                  ],
                );
              },
              error: (error, _) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        );

  }
}
