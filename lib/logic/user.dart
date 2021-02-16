
import 'package:pooyam_vettu/constants/level.dart';


class User {
  List allblocks = List();

  int mark = 0;
  int xmark = 0;
  int ymark = 0;
  List restrictedX = [];
  List restrictedY = [];

  bool isPreset(int i, int j) {
    

    bool status = false;
    for (var item in restrictedY) {
      if (item == j) {
        status = true;
      }
    }
    for (var item in restrictedX) {
      if (item == i) {
        status = true;
      }
    }
    return status;
  }

  int getMark() {
    xmark = 0;
    ymark = 0;

    calculateXMark();
    calculateYMark();
    //print('x mark is $mark');
    // print(xmark);
    //print(ymark);

    mark = mark + xmark;
    mark = mark + ymark;
    return mark;
  }

  void addBlock(int x, int y) {
    allblocks.add([x, y]);
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
          int index = -1;
          for (var restricted in restrictedX) {
            if (restricted == x) {
              index = 1;
            }
          }
          if (index == -1) {
            mark = xmark + sum;
            //  print(mark);
            restrictedX.add(x);
            //print(restrictedX);
          }
        }
      }
    }
  }

  //calculateXMark();
  void calculateYMark() {
    ymark = 0;
    for (var item in allblocks) {
      int status = -1;
      for (var restricted in restrictedY) {
        if (restricted == item[0]) {
          status = 1;
        }
      }
      if (status == -1) {
        if (item[1] == 0) {
          int x = item[0];
          //print(x);
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
          //  print(x);
            restrictedY.add(x);

            // print('i is ${item[0]}');
            print(restrictedY);
          }
        }
      }
    }
    // print('mark is $mark');
  }

  //calculateYMark();
}
