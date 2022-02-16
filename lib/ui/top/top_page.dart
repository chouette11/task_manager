import 'package:flutter/material.dart';
import 'package:task_manager/ui/components/appbar.dart';
import 'package:task_manager/ui/task_limit/page.dart';
import 'package:task_manager/ui/task_view/page.dart';


class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {

    Widget page;

    if (pageIndex < 2) {
      page = TaskLimitPage(pageIndex + 1);
    } else {
      page = TaskView();
    }

    return Scaffold(
      appBar: CustomAppbar(title: '',),
      body: Column(
        children: [
          page,
          BottomNavigationBar(
            onTap: (index) {
              pageIndex = index;
              setState(() {});
            },
            fixedColor: Colors.orange,
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(
                label: "1",
                icon: Icon(Icons.ac_unit, color: Colors.orange,),
              ),
              BottomNavigationBarItem(
                label: "2",
                icon: Icon(Icons.ac_unit, color: Colors.orange,)),
              BottomNavigationBarItem(
                  label: "3",
                  icon: Icon(Icons.ac_unit, color: Colors.orange,)),
              BottomNavigationBarItem(
                  label: "一覧",
                  icon: Icon(Icons.ac_unit, color: Colors.orange,)),
            ],
          ),
        ],
      ),
    );
  }
}