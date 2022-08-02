import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'cloud_firestore/cloud_fs_send_data.dart';
import 'fb_messaging/notifications.dart';
import 'fb_storage/pic_storage.dart';
import 'imagepicker.dart';
import 'notifications/ios_notificationns.dart';

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
                child:const Text("FBCloudFirestore")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>ProfileStorage()));
                },
                child:const Text("FBStorage")),
            ElevatedButton(
                onPressed: () async{
                  String? token = await FirebaseMessaging.instance.getToken();
                  print(token);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>ImageOpn()));
                },
                child:const Text("Image C/G")),
            ElevatedButton(
                onPressed: () async{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>NotificationsCode()));
                },
                child:const Text("IOS notifications")),
          ],
        ),
      ),
    );
  }
}
