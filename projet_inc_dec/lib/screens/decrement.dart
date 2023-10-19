import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key});


  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  TextEditingController _limitController = TextEditingController(); // Contrôleur pour le TextFormField

  void initState() {
    super.initState();
    _limitController.text = Provider.of<CounterProvider>(context, listen: false).counter.toString();
  }
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xff007CD3),
        title: Text("Decrement Page"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 252,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                controller: _limitController,
                decoration: InputDecoration(
                  labelText: "Limite décrémentation",
                  border: InputBorder.none,
                ),
              ),
            ),
            Text(
              '${counterProvider.counter}',
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
                    if (_limitController.text.isNotEmpty) {
                      int? limit = int.tryParse(_limitController.text);
                      if (limit != null) {
                        if (counterProvider.counter > 3) {
                          counterProvider.setCounter(limit);
                          _limitController.text = limit.toString();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Limite de décrémentation atteinte! Il faut incrémenter.'),
                            ),
                          );
                        }
                      }
                    }
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.reset();
                    _limitController.text = '0';
                  },
                  backgroundColor: Colors.red,
                  child: Icon(Icons.restart_alt),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
