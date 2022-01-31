import 'package:flutter/material.dart';

class CustomTest extends Text{

  CustomTest(String data,{color: Colors.black, textAlign: TextAlign.center, factor: 1.0}):
      super(
          data,
          textScaleFactor: factor,
          style: TextStyle(
              color: color
          )
      );
}