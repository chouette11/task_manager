import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartSchedulePage extends StatelessWidget {
  const StartSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/get_up/:'),
          child: Text("start"),
        ),
      ),
    );
  }
}
