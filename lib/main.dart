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
  late List<String> board;
  late String currentPlayer;
  late String winner;
  late bool isDraw;

  @override
  void initState() {
    super.initState();

    _initializeGame();
  }

  void _initializeGame() {
    board = List.generate(9, (_) => '');
    currentPlayer = 'X';
    winner = '';
    isDraw = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TicTac'), backgroundColor: Colors.blue),
      body: Column(
        children: [

          winner != ''
              ? Text('Winner: $winner', style: const TextStyle(fontSize: 30))
              : isDraw
                  ?   const Text('Draw', style: TextStyle(fontSize: 30))
                   : Text('Current Player: $currentPlayer', style: const TextStyle(fontSize: 30)),
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
                    child: MaterialButton
                      (onPressed: ()=>_handleTap(index),
                        child: Text(board[index], style: const TextStyle(fontSize: 40)),
                    ),
                  ),
                );
              },
            ),
          ),

          MaterialButton(
            onPressed: () {
              setState(() {

                _initializeGame();
              });
            },
            child: const Text('Restart Game'),
          ),
        ],
      ),
    );
  }
  
  void _handleTap(int index){
    if (board[index] != '' || winner != '') return;
    print("Index is $index");

setState(() {
  board[index] = currentPlayer;
  if (_checkWinner(currentPlayer)) {
    winner = currentPlayer;
  } else if (_checkDraw()) {
    isDraw = true;
  } else {
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
});



  }

  bool _checkWinner(String player) {
    // Check rows, columns and diagonals for a win
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player && board[i * 3 + 1] == player && board[i * 3 + 2] == player) {
        return true;
      }
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
        return true;
      }
    }
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }
    return false;
  }

  bool _checkDraw() {
    return board.every((cell) => cell != '');
  }
}
