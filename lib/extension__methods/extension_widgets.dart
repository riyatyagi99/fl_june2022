import 'package:flutter/material.dart';

extension CustomWidgets on Widget{
  
  Widget center(){
    return Center(
      child: this,
    );
  }

  Widget scaleEvenly(double scale){
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }
}

extension CustomStrings on String{
  String capitalFirst(){
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}