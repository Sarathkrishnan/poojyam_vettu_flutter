import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pooyam_vettu/constants/constants.dart';
import 'package:pooyam_vettu/screens/gameconfig.dart';

class Winner extends StatefulWidget {
  Winner({this.userMark, this.userNames});
  static String id = 'winner';
  List<String> userNames = [];
  List<int> userMark = [];

  @override
  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  String winner = ' ';
  void initState() {
    super.initState();
    int temp = 0;
    for (var i = 0; i < widget.userMark.length; i++) {
      print(i);

      if (temp < widget.userMark[i]) {
        setState(() {
          temp = widget.userMark[i];
          winner = widget.userNames[i];
          print(temp);
        });
      }
    }
  }

  void playMusic() {
    AssetsAudioPlayer applause = AssetsAudioPlayer();
    applause.open(
      Audio("music/applause.mp3"),
    );
  }

  @override
  Widget build(BuildContext context) {
    playMusic();
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset('lottie/winner.json'),
            ),
          ),
          Text(
            '$winner \n win the game',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          for (int i = 0; i < widget.userNames.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.userNames[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  widget.userMark[i].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              splashColor: kGrey,
              color: kBlue,
              onPressed: () {
                Navigator.pop(context);
                // Navigator.popAndPushNamed(context, GameConfig.id);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 60,
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
