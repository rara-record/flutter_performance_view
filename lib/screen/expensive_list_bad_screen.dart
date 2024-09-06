import 'package:flutter/material.dart';

final List<int> items = List.generate(100, (index) => index * 10);

class ExpensiveListBadScreen extends StatelessWidget {
  final String argument;
  const ExpensiveListBadScreen({super.key, required this.argument});

  int performExpensiveCalculation(int item) {
    // 비용이 많이 드는 계산을 시뮬레이션합니다.
    // 실제로는 이것이 복잡한 데이터 처리나 변환일 수 있습니다.
    int result = 0;
    for (int i = 0; i < 1000000; i++) {
      result += item;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(argument)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final result = performExpensiveCalculation(items[index]);
          return ListTile(title: Text('Item $index: $result'));
        },
      ),
    );
  }
}
