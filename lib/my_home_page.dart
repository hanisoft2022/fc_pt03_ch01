// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shake/shake.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  late ShakeDetector detector;
  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    WidgetsBinding.instance.addObserver(this);
    print('addObserver');
    ShakeDetector.autoStart(onPhoneShake: () {
      _incrementCounter();
      print('흔들었군요!');
      var scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.removeCurrentSnackBar(); // 또는 scaffoldMessenger.hideCurrentSnackBar();
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('흔들었군요!')));
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('흔들어서 카운트를 올려보세요.', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            Gap(12),
            Text('$_counter', style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
