import 'package:flutter/material.dart';
import 'package:projet_inc_dec/screens/connexionPage.dart';
import 'package:projet_inc_dec/screens/increment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ConnexionPage(),
    );
  }
}



class CounterProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  static const int incrementLimit = 10;
  static const int decrementLimit = 3;
  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset(){
    _counter = 0;
    notifyListeners();
  }

  void setCounter(int value) {
    _counter = value;
    notifyListeners();
  }
}


