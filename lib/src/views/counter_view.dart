import 'package:appname/src/controllers/counter_controller.dart';
import 'package:appname/src/services/counter_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  static const routeName = '/counter';

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final counterController = CounterController(CounterService());

  @override
  void initState() {
    counterController.loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.counter),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            AnimatedBuilder(
              animation: counterController,
              builder: (context, snapshot) {
                return Text(
                  '${counterController.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          counterController.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
