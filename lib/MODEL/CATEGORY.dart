import 'package:flutter/material.dart';

class Category{
  @required final id;
  @required final title;
  // final Color color;
  final String images;
  bool value;

   Category({this.id,this.title,this.images,this.value = false});
}