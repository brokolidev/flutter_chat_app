import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  Color buttonColor;

  CounterStateful({super.key, required this.buttonColor});

  @override
  State<CounterStateful> createState() {
    State<CounterStateful> stateClassAssociateWithThisWidget =
        _CounterStatefulState();
    return stateClassAssociateWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment() {
    if (mounted) {
      setState(() {
        counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custum Counter"),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        child: const Icon(Icons.add),
        onPressed: () {
          increment();
        },
      ),
    );
  }
}
