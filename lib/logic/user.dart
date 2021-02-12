import 'dart:collection';
import 'package:pooyam_vettu/constants/level.dart';
import 'package:pooyam_vettu/logic/block.dart';
import 'package:flutter/material.dart';

class User {
  String name;
  Color color;
  List allblocks = List();
  User({@required this.name, @required this.color});
  int mark = 0;
  void addBlock(int x, int y) {
    calculateXMark();
    calculateYMark();
    allblocks.add([x, y]);
    print(allblocks);
  }

  Color getColor(int x, int y) {
    var smallList=[x,y];
    int index = allblocks.firstWhere((smallList) => smallList == [x, y]);
    if (index > 0) {
      return color;
    } else{
      return Colors.black;
    }
  }

  void calculateXMark() {
    for (var item in allblocks) {
      if (item[0] == level - 1) {
        print(item);
        int x = item[1];
        // print(x);

        int sum = 0;
        for (var i in allblocks) {
          if (i[1] == x) {
            print(i);
            sum += 1;
          }
        }
        print(sum);
        print(x);
        print(" ");

        if ((sum + x) == level) {
          mark = mark + sum;
        }
      }
    }
    print('mark is $mark');
  }

  //calculateXMark();
  void calculateYMark() {
    for (var item in allblocks) {
      if (item[1] == 0) {
        int x = item[0];
        int sum = 0;
        for (var i in allblocks) {
          if (i[0] == x) {
            print(i);
            sum += 1;
          }
        }
        print('temp sum is $sum');

        print(" ");
        print(x);
        if (sum == x + 1) {
          mark = mark + sum;
        }
      }
    }
    print('mark is $mark');
  }

  //calculateYMark();
}
