import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProvider with ChangeNotifier {
  final list = List.generate(10, (index) => index);

  int get length => list.length;

  int at(int index) => list[index];

  int indexOf(int element) => list.indexOf(element);

  void removeElement(int element) {
    list.remove(element);
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
      body: ListView.builder(
        itemCount: listProvider.length,
        findChildIndexCallback: (key) {
          if (key is ValueKey<int>) {
            return listProvider.indexOf(key.value);
          }

          return null;
        },
        itemBuilder: (context, index) {
          return Provider.value(
            value: listProvider.at(index),
            child: const TileWithProvider(),
          );
        },
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () {
            context.read<ListProvider>().removeElement(element);
          },
          child: Text('$element'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
