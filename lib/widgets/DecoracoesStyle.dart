import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration FundoCorBorPretas (int cor, double borda){
  return BoxDecoration(
    color: Color(cor),
    border: Border.all(
      color: Colors.black,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(borda),
  );
}

BoxDecoration BordasTransparentes (){
  return BoxDecoration(
    color: Colors.transparent,
  );
}
