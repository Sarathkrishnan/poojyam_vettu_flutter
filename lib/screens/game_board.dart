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

  static User user1 = User(name: 'Sarath', color: Colors.red);
  static User user2 = User(name: 'Syam', color: Colors.green);
  var currentUser = user1;
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
    print(allblocks);
  }

  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          height: deviceHeight,
          width: deviceWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time: 2.00'),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.undo),
                        ),
                        decoration: BoxDecoration(
                          color: kYellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.redo),
                        ),
                        decoration: BoxDecoration(
                          color: kYellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kbgwhite,
                  borderRadius: BorderRadius.circular(20)

                ),
                child: Column(
                  children: [
                    for (var i = 0; i < level; i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (var j = 0; j <= i; j++)
                            GestureDetector(
                              onTap: () {
                                if (currentUser.name == 'Sarath') {
                                  currentUser = user2;
                                } else {
                                  currentUser = user1;
                                }
                                setState(() {
                                  removeBlock(i, j);
                                  currentUser.addBlock(i, j);

                                  print(currentUser.getMark());
                                });
                              },
                              child: Dot(
                                status: isElementPresent(i, j),
                                
                              ),
                            )
                        ],
                      ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Row(
                children: [Text('Current user : ${currentUser.name}')],
              ),
              Container(
                height: 100,
                color: Colors.blueAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(user1.name),
                          Text('Player 2 : ${user1.getMark().toString()}'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(user2.name),
                          Text('Player 2 : ${user2.getMark().toString()}'),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
