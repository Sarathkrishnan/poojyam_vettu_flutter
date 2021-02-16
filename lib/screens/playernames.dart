import 'package:flutter/material.dart';
import 'package:pooyam_vettu/constants/constants.dart';
import 'package:pooyam_vettu/screens/game_board.dart';

class PlayerList extends StatefulWidget {
  static String id = 'PlayerList';
  PlayerList({this.players});
  final int players;
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<TextEditingController> textFields = [];
  void generateTextController() {
    setState(() {
      for (var i = 0; i < widget.players; i++)
        textFields.add(TextEditingController(text: 'Player $i'));
      //  print(1);
    });
  }

  @override
  void initState() {
    super.initState();
    generateTextController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: 
    Stack(
      children: [
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Expanded(child: SizedBox()),
                Text(
                  'Player Names',
                  style: TextStyle(fontSize: 18,
                  color: Colors.white,
                  ),
                ),
                // Expanded(child: SizedBox()),
                for (var i = 0; i < widget.players; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                      ),
                      controller: textFields[i],
                      decoration: InputDecoration(
                        hintText: 'Player ${i + 1}',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        fillColor: kGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kBlue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          //borderSide: BorderSide(color: kBlue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
               SizedBox(
                 height: 100,
               )
              ],
            ),
          ),
        ),
               Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FlatButton(
                        splashColor: kGrey,
                        color: kBlue,
                        onPressed: () {
                          List<String> userName = List();
                          for (var i = 0; i < widget.players; i++) {
                            userName.add(textFields[i].text);
                          }
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameBoard(
                                userNames: userName,
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          
                          height: 60,
                         
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            'Start',
                            style: TextStyle(fontSize: 18,
                            color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
           
    
      ],
    )  ),
    );
  }
}
