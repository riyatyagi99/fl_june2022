import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {

  final StreamController _streamController = StreamController();

  addData()async{
    for(int i = 1; i<= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));

      _streamController.sink.add(i);
    }
  }

  Stream<int> numberStream() async*{
    for(int i = 1; i<= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Stream"),
      ),
      body: Center(
          child: StreamBuilder(
            stream: numberStream().map((number) => "number $number"),
            builder: (context, snapshot){
              if(snapshot.hasError) {
                return const Text("hey there is some error");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Text("${snapshot.data}", style: const TextStyle(fontSize: 30));
            },
          )
      ),

    );
  }
}
