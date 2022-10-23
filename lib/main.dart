import 'package:flutter/material.dart';
import 'package:keys/global_key_page.dart';
import 'package:keys/my_home_page.dart';
import 'package:keys/my_home_page_with_provider.dart';
import 'package:keys/pagination_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PaginationWithKeysApp());
}

class KeysApp extends StatelessWidget {
  const KeysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class KeysAppWithProvider extends StatelessWidget {
  const KeysAppWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: ChangeNotifierProvider<ListProvider>(
        create: (context) => ListProvider(),
        child: const MyHomePageWithProvider(),
      ),
    );
  }
}

class GlobalKeysApp extends StatelessWidget {
  const GlobalKeysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: GlobalKeyPage(),
    );
  }
}

class PaginationWithKeysApp extends StatelessWidget {
  const PaginationWithKeysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PaginationHomePage(),
    );
  }
}
