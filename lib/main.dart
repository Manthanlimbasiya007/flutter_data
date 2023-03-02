import 'package:flutter/material.dart';
import 'package:flutter_data/screen/counter/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'screen/counter/view/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Homeprovider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homescreen(),
      },
    ),
  ));
}
