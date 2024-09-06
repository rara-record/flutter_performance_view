import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Performance best practices',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: _buildWidget(context),
      ),
    );
  }
}

Widget _buildWidget(BuildContext context) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: pageData.length,
    itemBuilder: (BuildContext context, int index) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, pageData[index]['route']);
          },
          child: Text(pageData[index]['text']),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

List pageData = [
  {
    "route": "/1/bad",
    "text": "STEP ONE BAD CASE",
  },
  {
    "route": "/1/good",
    "text": "STEP ONE GOOD CASE",
  },
  {
    "route": "/2/bad",
    "text": "STEP TWO BAD CASE",
  },
  {
    "route": "/2/good",
    "text": "STEP TWO GOOD CASE",
  },
  {
    "route": "/3/bad",
    "text": "STEP THREE BAD CASE",
  },
  {
    "route": "/3/good",
    "text": "STEP THREE GOOD CASE",
  },
  {
    "route": "/4/bad",
    "text": "STEP FOUR BAD CASE",
  },
  {
    "route": "/4/good",
    "text": "STEP FOUR GOOD CASE",
  },
];