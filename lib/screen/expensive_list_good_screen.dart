import 'package:flutter/material.dart';

class ExpensiveListGoodScreen extends StatefulWidget {
  final String argument;

  const ExpensiveListGoodScreen({
    super.key,
    required this.argument,
  });

  @override
  State<ExpensiveListGoodScreen> createState() =>
      _ExpensiveListGoodScreenState();
}

class _ExpensiveListGoodScreenState extends State<ExpensiveListGoodScreen> {
  late List<int> items;
  late List<int> precalculatedResults;

  @override
  void initState() {
    super.initState();
    items = List.generate(100, (index) => index * 10);
    // 초기화 시점에 모든 결과를 미리 계산합니다.
    precalculatedResults =
        items.map((item) => performExpensiveCalculation(item)).toList();
  }

  int performExpensiveCalculation(int item) {
    // 비용이 많이 드는 계산을 시뮬레이션합니다.
    int result = 0;
    for (int i = 0; i < 1000000; i++) {
      result += item;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.argument)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            // 미리 계산된 결과를 사용합니다.
            title: Text(
              'Item $index: ${precalculatedResults[index]}',
            ),
          );
        },
      ),
    );
  }
}
