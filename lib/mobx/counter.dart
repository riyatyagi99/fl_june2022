

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'mobx_store.dart';

class CounterWithMobX extends StatefulWidget {
  const CounterWithMobX({Key? key}) : super(key: key);

  @override
  State<CounterWithMobX> createState() => _CounterWithMobXState();
}

class _CounterWithMobXState extends State<CounterWithMobX> {
  CounterStore _counter = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (context){
                return Text(
                  '${_counter.counter}',
                  style: TextStyle(fontSize: 30),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //todo code
          _counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
