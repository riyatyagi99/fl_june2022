import 'package:flutter/material.dart';

import 'cloud_firestore/cloud_fs_send_data.dart';

class FBOperations extends StatelessWidget {
  const FBOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>SendData()));
                },
                child:const Text("SendData")),
          ],
        ),
      ),
    );
  }
}
