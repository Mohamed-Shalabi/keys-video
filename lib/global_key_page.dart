import 'package:flutter/material.dart';

final switchKey = GlobalKey<_MySwitchState>();

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({Key? key}) : super(key: key);

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {
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
            const MySwitchController(),
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

class MySwitchController extends StatefulWidget {
  const MySwitchController({Key? key}) : super(key: key);

  @override
  State<MySwitchController> createState() => _MySwitchControllerState();
}

class _MySwitchControllerState extends State<MySwitchController> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switchKey.currentState!.toggle();
      },
      child: const Text('Toggle Switch'),
    );
  }
}
