

import 'package:flutter_june2022/testing_cases/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('',(){

  test('Counter value should increased',(){
  final counter=Counterr();
  counter.increment();
  expect(counter.value, 1);
  });

  test('Counter value should decreased',(){
    final counter=Counterr();
    counter.decrement();
    expect(counter.value, -1);
  });

  test('Counter value should be',(){
    final counter=Counterr();
   // counter.increment();
    expect(counter.value, 0);
  });



  });
}