import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({
    @required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
      ),
      child: !status
          ? Icon(
              Icons.close,
              size: 20,
            )
          : SizedBox(
              height: 20,
              width: 20,
            ),
    );
  }
}
