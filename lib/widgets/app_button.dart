import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton (void Function()? onPressed , BuildContext context ,
    Widget child , Color backGround) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: backGround ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ))
      , child: child);
}