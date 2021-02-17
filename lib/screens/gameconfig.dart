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
  bool bgmStatus = true;
 
  void increasePlayer() {
    setState(() {
      if (numberOfPlayers < 8) {
        numberOfPlayers++;
      }
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
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: RawMaterialButton(
              //     onPressed: () {
              //       setState(() {
              //         pauseMusic();
              //       });
              //     },
              //     elevation: 5.0,
              //     fillColor: kGrey,
              //     child: Icon( bgmStatus?
              //       Icons.music_note:Icons.music_off,
              //       color:Colors.white,
              //       size: 20.0,
              //     ),
              //     padding: EdgeInsets.all(15.0),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
              Expanded(child: SizedBox()),
              Text(
                'Number of players',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlayerEditButton(
                      function: decreasePlayer, icon: Icons.remove),
                  Text(
                    numberOfPlayers.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  PlayerEditButton(function: increasePlayer, icon: Icons.add),
                ],
              ),
              Expanded(child: SizedBox()),
              // Text(
              //   'Select Gameboard',
              //   style: TextStyle(fontSize: 18,
              //   color: Colors.white,),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //           height: 100,
              //           width: 100,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: kBlue,
              //           ),
              //           child: Icon(
              //             Icons.change_history_rounded,
              //             size: 50.0,
              //           )),
              //     ),
              //   ],
              // ),
              Expanded(child: SizedBox()),
              RawMaterialButton(
                splashColor: kYellow,
                fillColor: kBlue,
                elevation: 5.0,
                //color: kBlue,
                onPressed: () {
                  // print(numberOfPlayers);
                 // Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerList(
                        players: numberOfPlayers,
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
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
          color: kBlue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 5,
              offset: Offset(5.0, 5.0), // shadow direction: bottom right
            )
          ],
        ),
        height: 50,
        width: 50,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
