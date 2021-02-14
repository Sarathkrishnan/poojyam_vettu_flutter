import 'package:flutter/material.dart';
import 'package:pooyam_vettu/componets/dot.dart';
import 'package:pooyam_vettu/constants/constants.dart';
import 'package:pooyam_vettu/constants/level.dart';

import 'package:pooyam_vettu/logic/user.dart';

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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: deviceHeight,
                //width: deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Time: 2.00'),
                    //     Row(
                    //       children: [
                    //         Container(
                    //           width: 40,
                    //           height: 40,
                    //           child: IconButton(
                    //             onPressed: () {},
                    //             icon: Icon(Icons.undo),
                    //           ),
                    //           decoration: BoxDecoration(
                    //             color: kYellow,
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         ),
                    //         SizedBox(width: 20),
                    //         Container(
                    //           width: 40,
                    //           height: 40,
                    //           child: IconButton(
                    //             onPressed: () {},
                    //             icon: Icon(Icons.redo),
                    //           ),
                    //           decoration: BoxDecoration(
                    //             color: kYellow,
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ),

                    SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kbgwhite,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < level; i++)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (var j = 0; j <= i; j++)
                                    GestureDetector(
                                      onTap: () {
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
                                        // print(currentUser);
                                      },
                                      child: Dot(
                                        status: isElementPresent(i, j),
                                        isclosed: user.isPreset(j, i),
                                      ),
                                    )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              print(user.restrictedX);
                              //print(user.restrictedY);
                            },
                            child: Text(
                                'Current user : ${widget.userNames[currentUser]}'))
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kbgwhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < widget.userNames.length; i++)
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    (currentUser == i) ? kYellow : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                  '${widget.userNames[i]} : ${userMark[i]}'),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
