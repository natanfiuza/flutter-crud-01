import 'package:flutter/material.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_crud/provider/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: UserList(),
      ),
    );
  }
}
