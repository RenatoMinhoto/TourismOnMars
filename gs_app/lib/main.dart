import 'package:flutter/material.dart';
import 'package:gs_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism on Mars',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 102, 0),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 190, 247, 255)),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 190, 247, 255)),
          titleTextStyle:
              TextStyle(color: Color.fromARGB(255, 172, 221, 241), fontSize: 25),
        ),
      ),
      home: LoginScreen(),
    );
  }
}


