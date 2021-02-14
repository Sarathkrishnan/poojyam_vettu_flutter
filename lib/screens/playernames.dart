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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: deviceWidth,
            height: deviceHeight,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    'Player Names',
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(child: SizedBox()),
                  for (var i = 0; i < widget.players; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textFields[i],
                        decoration: InputDecoration(
                          hintText: 'Player ${i + 1}',
                          fillColor: kYellow,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kYellow),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kYellow),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  Expanded(flex: 2, child: SizedBox()),
                  FlatButton(
                    splashColor: kYellow,
                    color: kbgwhite,
                    onPressed: () {
                      List<String> userName=List();
                      for (var i = 0; i < widget.players; i++) {
                        
                        userName.add(textFields[i].text);
                      }
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
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
