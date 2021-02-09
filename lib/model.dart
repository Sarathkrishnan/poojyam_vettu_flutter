class DotModel {
  List dot = [
    [
      [0],
    ],
    [
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
    ],
  ];
}

class Experiment {
  List dots = List.generate(10, (x) {
    List XLevel = List.generate(x, (y) {
      List yLevel = List.generate(y, (index) {
        return [0];
      });
    });
  });
}
// class DotModel {
//   int xCordinate;
//   int yCordinate;
//   bool status;
//   DotModel({this.xCordinate, this.yCordinate, this.status = false});
// }

// class SquareShape {
//   List<DotModel> dots = List<DotModel>.generate(10, (index) {
//     for (var i = 0; i < index; i++)
//       for (var j = 0; i < i; j++)
//         return DotModel(xCordinate:i,yCordinate:j);

//   });

//   bool getStatus(int x, int y){
//     return dots.
//   }
// }
