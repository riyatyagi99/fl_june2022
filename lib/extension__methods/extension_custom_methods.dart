import 'package:flutter/material.dart';
import 'package:flutter_june2022/extension__methods/extension_widgets.dart';

class CustomExtnWidgets extends StatelessWidget {
  const CustomExtnWidgets({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var name="kjhgfdsadfghjkjhgfdsghjhgfdszxcvghj";
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Text("Riya Tyagi").center(),
             Text("Riya Tyagi").scaleEvenly(5),
             Text("Heyyy").scaleEvenly(5),
             Text(name.capitalFirst())
          ],
        ),
      ),
    );
  }
}
