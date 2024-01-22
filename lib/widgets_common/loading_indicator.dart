import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';

Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor:AlwaysStoppedAnimation(redColor),
  );
}