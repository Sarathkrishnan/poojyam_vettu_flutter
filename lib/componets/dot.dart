import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
   Dot({
    @required this.status,
   
  });

  final bool status;
  
  @override
  Widget build(BuildContext context) {
    double deviceWidth=MediaQuery.of(context).size.width;
    double deviceHeight=MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth*0.08,
      height: deviceWidth*0.08,

      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
      ),
      child: !status
          ? Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            )
          : SizedBox(
              height: 20,
              width: 20,
            ),
    );
  }
}
