import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys App'),
      ),
      body: ListView(
        children: [
          for (var index = 0; index < list.length; index++)
            InkWell(
              key: ValueKey(list[index]),
              onTap: () {
                setState(() {
                  final element = list.removeAt(index);
                  list.insert(index + 1, element);
                });
              },
              child: Tile(
                element: list[index],
              ),
            )
        ],
      ),
    );
  }
}

class Tile extends StatefulWidget {
  const Tile({Key? key, required this.element}) : super(key: key);

  final int element;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  late int element;

  @override
  void initState() {
    element = widget.element;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text('$element'),
      ),
    );
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
