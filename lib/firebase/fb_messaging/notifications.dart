import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_june2022/extension__methods/extension_widgets.dart';

class NotificationsFB extends StatefulWidget {
  const NotificationsFB({Key? key}) : super(key: key);

  @override
  State<NotificationsFB> createState() => _NotificationsFBState();
}

class _NotificationsFBState extends State<NotificationsFB> {

  String title = "Title";
  String helper = "helper";


  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      setState(() {
        title =  "Hey Riya";       //msg["notification"]["title"];
        helper = "You have recieved a new notification";
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {
      setState(() {
        title =  "Hey praaaani" ;   //msg["data"]["title"];
        helper = "You have open the application from notification";
      });
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title).center(),
            Text(helper).center(),
          ],
        ),
      ),
    );
  }
}
