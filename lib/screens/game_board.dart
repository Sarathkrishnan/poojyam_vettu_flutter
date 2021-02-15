import 'package:flutter/material.dart';
import 'package:pooyam_vettu/componets/dot.dart';
import 'package:pooyam_vettu/constants/constants.dart';
import 'package:pooyam_vettu/constants/level.dart';
import 'package:lottie/lottie.dart';
import 'package:pooyam_vettu/logic/user.dart';
import 'package:pooyam_vettu/screens/winner.dart';

class GameBoard extends StatefulWidget {
  static String id = 'game_board';
  List<String> userNames = [];
  GameBoard({this.userNames});
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  List allblocks = List();
  List removedBlocks = List();
  List<int> userMark = List();
  int currentUser = 0;
  User user = User();
  void removeBlock(int x, int y) {
    allblocks.removeWhere((element) => element[0] == x && element[1] == y);
    print('removed');
    if (allblocks.isEmpty) {
      Future.delayed(Duration(seconds: 2), () {
        print(widget.userNames);
        print(userMark);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Winner(
              userNames: widget.userNames,
              userMark: userMark,
            ),
          ),
        );
      });
    }
  }

  bool isElementPresent(int x, int y) {
    var element =
        allblocks.where((element) => element[0] == x && element[1] == y);

    if (element.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    for (var x = 0; x < level; x++) {
      for (var y = 0; y <= x; y++) {
        allblocks.add([x, y]);
      }
    }
    for (var i = 0; i < widget.userNames.length; i++) {
      userMark.add(0);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  for (var i = 0; i < level; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var j = 0; j <= i; j++)
                          GestureDetector(
                            onTap: () {
                              if (isElementPresent(i, j)) {
                                removeBlock(i, j);
                                user.addBlock(i, j);

                                userMark[currentUser] += user.getMark();
                                user.mark = 0;
                                setState(() {
                                  if (currentUser <
                                      widget.userNames.length - 1) {
                                    currentUser++;
                                  } else {
                                    currentUser = 0;
                                  }
                                });
                              }
                              // print(currentUser);
                            },
                            child: Dot(
                              status: isElementPresent(i, j),
                              isclosed: user.isPreset(j, i),
                            ),
                          )
                      ],
                    ),
                  Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kbgwhite, borderRadius: BorderRadius.circular(10)),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < widget.userNames.length; i++)
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: (currentUser == i) ? kYellow : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('${widget.userNames[i]} : ${userMark[i]}'),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
