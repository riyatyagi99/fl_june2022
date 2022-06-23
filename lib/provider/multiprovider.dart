import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class MultiProviderPkg extends StatefulWidget {
  const MultiProviderPkg({Key? key}) : super(key: key);

  @override
  State<MultiProviderPkg> createState() => _MultiProviderPkgState();
}

class _MultiProviderPkgState extends State<MultiProviderPkg> {


  @override
  Widget build(BuildContext context) {
    final counter= Provider.of<Counter1>(context,listen: false);   //false- to avoid rebuilt of other widgets, and wrap that particular widget with consumer
    final counter2= Provider.of<Counter2>(context,listen: false);   //false- to avoid rebuilt of other widgets, and wrap that particular widget with consumer

    // final counter= Provider.of<ValueNotifier<int>>(context,listen: false);

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                // value notifier
                /*  Consumer<ValueNotifier<int>>(
                  builder: (BuildContext context, value, Widget? child)
                  {
                    return  Text(" Value increased to ${value.value}");
                  },)*/
                //change notifier
                Consumer<Counter1>(
                    builder: (BuildContext context, value, Widget? child)
                    {
                      return  Text(" Value increased to ${value.count}");
                    },),
                Consumer<Counter2>(
                    builder: (BuildContext context, value, Widget? child)
                    {
                      return  Text(" Value decreased to ${value.count}");
                    },)

              ],
            ),
          )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            // onPressed: ()=>counter.value++,
          onPressed: () {
              counter.increment();
            },
            child: const Text("+"),

          ),
          FloatingActionButton(
            // onPressed: ()=>counter.value++,
          onPressed: () {
              counter2.decrement();
            },
            child: const Text("-"),

          ),
        ],
      ),
    );
  }
}
