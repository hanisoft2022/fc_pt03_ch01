import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shake_gesture/shake_gesture.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppLifecycleState.resumed:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppLifecycleState.paused:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: ShakeGesture(
        onShake: () {
          _incrementCounter();

          var scaffoldMessenger = ScaffoldMessenger.of(context);
          scaffoldMessenger.removeCurrentSnackBar(); // 또는 scaffoldMessenger.hideCurrentSnackBar();
          scaffoldMessenger.showSnackBar(const SnackBar(content: Text('흔들었군요!')));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('흔들어서 카운트를 올려보세요.', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
              Gap(12),
              Text('$_counter', style: Theme.of(context).textTheme.displayLarge),
            ],
          ),
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
