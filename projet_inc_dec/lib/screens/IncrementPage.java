import 'package:flutter/material.dart';
import 'package:project_2/screens/decrement.dart';
import 'package:provider/provider.dart';

import '../main.dart';
class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff007CD3),
        title: Text("Increment Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${counterProvider.counter}',
              style: TextStyle(
                fontSize: 48.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.increment();
                  },
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.reset();
                  },
                  backgroundColor: Colors.red,
                  child: Icon(Icons.restart_alt),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Transform.translate(
              offset: Offset(120, 240),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DecrementPage();
                        }));
                  },
                  child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 50,
            ),
                ))
          ],
        ),
      ),
    );
  }
}
