import 'package:flutter/material.dart';


class ResponsiveDesign extends StatefulWidget {
  const ResponsiveDesign({Key? key}) : super(key: key);

  @override
  State<ResponsiveDesign> createState() => _ResponsiveDesignState();
}

class _ResponsiveDesignState extends State<ResponsiveDesign> {
  @override
  Widget build(BuildContext context) {
   var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width:width ,
        color:width<600? Colors.green:Colors.blue,
      ),
    );
  }
}
