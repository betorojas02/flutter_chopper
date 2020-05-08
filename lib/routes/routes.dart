import 'package:chopperapp/pages/home.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'         : (BuildContext context) => HomePage(),

  };
}