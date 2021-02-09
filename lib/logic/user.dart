import 'dart:collection';
import 'package:pooyam_vettu/logic/block.dart';

class User {
  String name;
  Set<Block> allblocks = HashSet();
  User({this.name});
  int mark = 0;
  void addBlock(int x, int y) {
    allblocks.add(Block(x: x, y: y));
  }

  void calulateMark() {
    
  }
}
