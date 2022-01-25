import 'package:flutter/material.dart';
import 'package:task_manager/pages/task_limit/page.dart';
import 'package:task_manager/pages/task_view/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {

    Widget page;

    if (pageIndex < 2) {
      page = TaskLimitPage(pageIndex + 1);
    } else {
      page = TaskView();
    }

    return Column(
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
    );
  }
}