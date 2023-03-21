
import 'package:flutter/material.dart';

final BoxDecoration standardBoxdecoration = BoxDecoration(
    color: Colors.grey[200],
    border: Border.all(color: Colors.grey[700]!, width: 2),
    borderRadius: BorderRadius.circular(15)
);

final AppBar standardAppbar = AppBar(
  title: Text("Strength track", style: TextStyle(color: Colors.black),),
  backgroundColor: Colors.grey[200],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20),
    ),
  ),
);