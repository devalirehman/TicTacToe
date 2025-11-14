import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: TicTac(),
    );
  }
}

class TicTac extends StatefulWidget {
  const TicTac({super.key});

  @override
  State<TicTac> createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TicTac'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Text('Game State', style: const TextStyle(fontSize: 30)),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: MaterialButton(onPressed: () {}, child: Text('X')),
                  ),
                );
              },
            ),
          ),

          MaterialButton(
              onPressed: (){},
            child: const Text('Restart Game'),
          ),
        ],
      ),
    );
  }
}
