import 'package:flutter/material.dart';
import 'package:value_notifier_app_1/src/home/controller/counter_padronizacao_value_notifier.dart';
// import 'package:value_notifier_app_1/app/controller/home_controller_change_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  /// Controller extending ChangeNotifier
  // final HomeControllerChangeNotifier _controllerChangeNotifier = HomeControllerChangeNotifier();
  // int get _counter => _controller.counter;

  /// Controller with property counter as ValueNotifier
  // final HomeControllerValueNotifier _controllerValueNotifier = HomeControllerValueNotifier();
  // int get _counter => _controllerValueNotifier.counter;

  /// CLASS Counter that extends ValueNotifier
  final Counter _counterValueNotifier = Counter();
  int get _counter => _counterValueNotifier.value;

  @override
  void initState() {
    super.initState();

    /// Adding listener to the CLASS HomeControllerChangeNotifier instance that extends/inherits ChangeNotifier
    // _controllerChangeNotifier.addListener((){
    //   setState(() {});
    // });

    /// Adding listener to the ValueNotifier PROPERTY of the HomeControllerValueNotifier class instance
    // _controllerValueNotifier.counter$.addListener((){
    //   setState(() {});
    // });

    ///Adding listener to the class that inherits ValueNotifier
    // _counterValueNotifier.addListener(() => setState(() {}));

    // Using listenables in initState as we were using above, we're re-building the entire widget tree (not a huge problem in Flutter, if we´re using constants),
    //but, if we want to re-build only some elements, we can use builders, such as AnimatedBuilder.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // AnimatedBuilder(
            //   animation: _counterValueNotifier,  // Listenable
            //   builder: (context, child) {
            //     return Text(
            //       '$_counter',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // )
            ValueListenableBuilder<int>(
              valueListenable: _counterValueNotifier,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterValueNotifier.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
