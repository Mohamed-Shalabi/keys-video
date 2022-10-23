import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProvider with ChangeNotifier {
  final list = List.generate(10, (index) => index + 1);

  int get length => list.length;

  int at(int index) => list[index];

  int indexOf(int element) => list.indexOf(element);

  void swapElement(int element) {
    final index = list.indexOf(element);
    list.removeAt(index);
    list.insert(index + 1, element);
    notifyListeners();
  }
}

class MyHomePageWithProvider extends StatelessWidget {
  const MyHomePageWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProvider = context.watch<ListProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys App'),
      ),
      body: ListView(
        children: [
          for (var index = 0; index < listProvider.length; index++)
            Provider.value(
              value: listProvider.at(index),
              child: const TileWithProvider(),
            ),
        ],
      ),
    );
  }
}

class TileWithProvider extends StatefulWidget {
  const TileWithProvider({Key? key}) : super(key: key);

  @override
  State<TileWithProvider> createState() => _TileWithProviderState();
}

class _TileWithProviderState extends State<TileWithProvider> {
  @override
  Widget build(BuildContext context) {
    final element = context.watch<int>();

    return InkWell(
      onTap: () {
        context.read<ListProvider>().swapElement(element);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('$element'),
        ),
      ),
    );
  }
}
