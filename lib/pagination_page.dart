import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginationHomePageViewModel extends ChangeNotifier {
  final data = List.generate(100, (index) => index + 1);
  var currentPageData = <int>[];

  final GlobalKey<PaginationListViewState> paginationKey =
      GlobalKey<PaginationListViewState>();

  void getPageData(int pageIndex) {
    try {
      currentPageData = data.sublist(pageIndex * 10, pageIndex * 10 + 10);
      paginationKey.currentState?.updatePageIndexWidget(pageIndex);

      notifyListeners();
    } on RangeError catch (_) {}
  }
}

// -----------------------------------------------------------------------

class PaginationHomePage extends StatelessWidget {
  const PaginationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key Pagination Example'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => PaginationHomePageViewModel()..getPageData(0),
        builder: (context, _) {
          final viewModel = context.watch<PaginationHomePageViewModel>();
          return PaginationListView(
            key: viewModel.paginationKey,
            getPageData: viewModel.getPageData,
            children: viewModel.currentPageData
                .map(
                  (number) => Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text('$number'),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------

class PaginationListView extends StatefulWidget {
  const PaginationListView({
    required GlobalKey<PaginationListViewState> key,
    required this.children,
    required this.getPageData,
  }) : super(key: key);

  final List<Widget> children;
  final void Function(int index) getPageData;

  @override
  State<PaginationListView> createState() => PaginationListViewState();
}

class PaginationListViewState extends State<PaginationListView> {
  int currentPageIndex = 0;
  final scrollController = ScrollController();

  void updatePageIndexWidget(int index) {
    setState(() {
      currentPageIndex = index;
    });

    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        ...widget.children,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                widget.getPageData(currentPageIndex - 1);
              },
              child: const Text('Previous'),
            ),
            TextButton(
              onPressed: () {
                widget.getPageData(currentPageIndex + 1);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
