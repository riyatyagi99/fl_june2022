

import 'package:mobx/mobx.dart';
part 'mobx_store.g.dart';  //same name as class.dart name            //flutter packages pub run build_runner build        -- run this command

class CounterStore  = Counter with _$CounterStore;

abstract class Counter with Store{
  @observable
  int counter = 0;

  @action
  void increment(){
    counter++;
  }
}