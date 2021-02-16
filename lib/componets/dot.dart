import 'package:flutter/material.dart';
import 'package:pooyam_vettu/constants/constants.dart';

class Dot extends StatelessWidget {
  Dot({
    @required this.status,
    @required this.isclosed,
  });

  final bool status;
  final bool isclosed;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    

    return Container(
      alignment: Alignment.center,
      width:deviceWidth*0.08,
      height: deviceWidth*0.08,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isclosed ? kBlue : Colors.yellow,
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
