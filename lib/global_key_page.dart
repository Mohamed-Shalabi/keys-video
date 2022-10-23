import 'package:flutter/material.dart';

class GlobalKeyPage extends StatelessWidget {
  GlobalKeyPage({Key? key}) : super(key: key);

  final switchKey = GlobalKey<_MySwitchState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MySwitch(key: switchKey),
            TextButton(
              onPressed: () {
                switchKey.currentState?.toggle();
              },
              child: const Text('Toggle Switch'),
            ),
          ],
        ),
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  var isDone = false;

  void toggle() {
    setState(() => isDone = !isDone);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isDone,
      onChanged: (bool value) {
        toggle();
      },
    );
  }
}
