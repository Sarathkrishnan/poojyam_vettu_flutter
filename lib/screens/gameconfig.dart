import 'package:flutter/material.dart';
import 'package:pooyam_vettu/constants/constants.dart';
import 'package:pooyam_vettu/screens/playernames.dart';

class GameConfig extends StatefulWidget {
  static String id = 'GameConfig';

  @override
  _GameConfigState createState() => _GameConfigState();
}

class _GameConfigState extends State<GameConfig> {
  int numberOfPlayers = 2;
  void increasePlayer() {
    setState(() {
      numberOfPlayers++;
    });
  }

  void decreasePlayer() {
    setState(() {
      if (numberOfPlayers > 2) {
        numberOfPlayers--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: SizedBox()),
              Text(
                'Number of players',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlayerEditButton(
                      function: decreasePlayer, icon: Icons.remove),
                  Text(
                    numberOfPlayers.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  PlayerEditButton(function: increasePlayer, icon: Icons.add),
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                'Select Gameboard',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kYellow,
                        ),
                        child: Icon(
                          Icons.change_history_rounded,
                          size: 50.0,
                        )),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              FlatButton(
                splashColor: kYellow,
                color: kbgwhite,
                onPressed: () {
                 // print(numberOfPlayers);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerList(players: numberOfPlayers,),
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
    );
  }
}

class PlayerEditButton extends StatelessWidget {
  final Function function;
  final IconData icon;
  PlayerEditButton({this.function, this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 50,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
