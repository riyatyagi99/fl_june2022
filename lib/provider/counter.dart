import 'package:flutter/material.dart';

class Counter1 extends ChangeNotifier{
  int count=0;

  void increment (){
    count++;
    notifyListeners();
  }
}

class Counter2 extends ChangeNotifier{
  int count=1;

  void decrement (){
    count--;
    notifyListeners();
  }
}