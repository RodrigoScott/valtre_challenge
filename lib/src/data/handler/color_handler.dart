import 'package:flutter/material.dart';

Color colorFromInt(String id){
  Color resultColor;
  switch (id) {
    case 'black':
      resultColor = Colors.black87;
      break;
    case 'blue':
      resultColor = Colors.blue;
      break;
    case 'brown':
      resultColor = Colors.brown;
      break;
    case 'gray':
      resultColor = Colors.grey;
      break;
    case 'green':
      resultColor = Colors.green;
      break;
    case 'pink':
      resultColor = Colors.pink;
      break;
    case 'purple':
      resultColor = Colors.purple;
      break;
    case 'red':
      resultColor = Colors.red;
      break;
    case 'white':
      resultColor = Colors.black12;
      break;
    case 'yellow':
      resultColor = Colors.yellow;
      break;
    default:
      resultColor = Colors.teal;
  }
  return resultColor;
}