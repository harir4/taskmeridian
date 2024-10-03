import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/modelview/modelview/dataController.dart';
import 'package:task/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataController()),
    ],
    child: MaterialApp(
      home: Home(),
    ),
  ));
}
