import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  late List<String> list;

  @override
  void initState() {
    super.initState();
    list = List.generate(50, (index) => 'Item $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = list[index];
          return ListTile(
            title: Text(item),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
