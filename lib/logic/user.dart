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
  int xmark = 0;
  int ymark = 0;

  int getMark() {
    calculateXMark();
    calculateYMark();
    mark = xmark + ymark;
    return mark;
  }

  void addBlock(int x, int y) {
    calculateXMark();
    calculateYMark();
    allblocks.add([x, y]);
    print(allblocks);
  }

  bool isItem(int x, int y) {
    var result =
        allblocks.where((smallList) => smallList[0] == x && smallList[1] == y);
    if (result.length>0) {
      return false;
    } else {
      return true;
    }
  }

  void calculateXMark() {
    xmark = 0;
    for (var item in allblocks) {
      if (item[0] == level - 1) {
        // print(item);
        int x = item[1];
        // print(x);

        int sum = 0;
        for (var i in allblocks) {
          if (i[1] == x) {
            //   print(i);
            sum += 1;
          }
        }
        //  print(sum);
        // print(x);
        // print(" ");

        if ((sum + x) == level) {
          xmark = xmark + sum;
        }
      }
    }
  }

  //calculateXMark();
  void calculateYMark() {
    ymark = 0;
    for (var item in allblocks) {
      if (item[1] == 0) {
        int x = item[0];
        int sum = 0;
        for (var i in allblocks) {
          if (i[0] == x) {
            //  print(i);
            sum += 1;
          }
        }
        // print('temp sum is $sum');

        // print(" ");
        //  print(x);
        if (sum == x + 1) {
          ymark = ymark + sum;
        }
      }
    }
    // print('mark is $mark');
  }

  //calculateYMark();
}
