import 'package:flutter/material.dart';
import 'package:pooyam_vettu/componets/dot.dart';
import 'package:pooyam_vettu/logic/block.dart';
import 'dart:collection';

import 'package:pooyam_vettu/logic/user.dart';

class GameBoard extends StatefulWidget {
  static String id = 'game_board';

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Set<Block> allblocks = HashSet();
  int level = 5;
  static User user1 = User(name: 'Sarath');
  static User user2 = User(name: 'Syam');
  var currentUser = user1;
  void removeBlock() {
    Block element = Block(x: 10, y: 10);
    allblocks.remove(element);
  }

  void showAllBlocks() {
    allblocks.forEach((block) {
      print(block.values);
    });
  }

  bool isElementPresent(int x, int y) {
    var element =
        allblocks.where((element) => element.x == x && element.y == y);
    print(element);
    if (element.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    for (var x = 0; x <= level; x++) {
      for (var y = 0; y <= x; y++) {
        allblocks.add(Block(x: x, y: y));
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (var i = 0; i <= level; i++)
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
                          allblocks.removeWhere(
                              (element) => element.x == i && element.y == j);
                          currentUser.addBlock(i, j);
                        });
                      },
                      child: Dot(
                        status: isElementPresent(i, j),
                      ),
                    )
                ],
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
                        Text('Player 2 : 15'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(user2.name),
                        Text('Player 2 : 15'),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
