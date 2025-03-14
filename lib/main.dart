import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/my_string_viewmodel.dart';
import 'view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyStringViewModel(),
      child: MaterialApp(
        title: 'Flutter MVVM Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomeScreen(),
      ),
    );
  }
}
