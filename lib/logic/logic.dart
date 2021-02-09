import 'dart:collection';

import 'package:pooyam_vettu/logic/block.dart';

void main() {
  Set<Block> allblocks = HashSet();
  for (var x = 0; x <= 10; x++) {
    for (var y = 0; y <= x; y++) {
      allblocks.add(Block(x: x, y: y));
    }
  }

  Block element = Block(x: 10, y: 10);
  allblocks.remove(element);
  var count=0;
  allblocks.forEach((block) {
    print(block.values);
    count++;
  });
  print(count);

  
}

