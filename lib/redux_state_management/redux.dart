import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';



enum Actions { inc, dec }

int counterReducer(int count, dynamic action){

  if(action == Actions.inc) {
    return count + 1;
  } else if(action == Actions.dec){
    if(count==0){
      return count;
    }else{
      return count - 1;
    }

  }
  return count;
}


class ReduxState extends StatefulWidget {
  final Store<int> store;


  const ReduxState({Key? key, required this.store}) : super(key: key);

  @override
  State<ReduxState> createState() => _ReduxStateState();
}

class _ReduxStateState extends State<ReduxState> {


  @override
  Widget build(BuildContext context) {
    return StoreProvider(store: widget.store, child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Redux Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StoreConnector<int, String>(builder: (context, count){
                return Text("Count is $count");
              }, converter: (store) => store.state.toString()),

              StoreConnector<int, VoidCallback>(builder: (context, callback){
                return TextButton(onPressed: callback, child: const Text("Increment"));
              }, converter: (store){
                return () => store.dispatch(Actions.inc);
              }),

              StoreConnector<int, VoidCallback>(builder: (context, callback){
                return TextButton(onPressed: callback, child: const Text("Decrement"));
              }, converter: (store){
                return () => store.dispatch(Actions.dec);
              })
            ],
          ),
        ),
      ),
    ));
  }
}

