import 'package:flutter/material.dart';


class NotificationsCode extends StatefulWidget {
  const NotificationsCode({Key? key}) : super(key: key);

  @override
  State<NotificationsCode> createState() => _NotificationsCodeState();
}

class _NotificationsCodeState extends State<NotificationsCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Seeeee the notifictaions",style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
