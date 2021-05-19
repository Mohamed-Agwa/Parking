import 'package:flutter/material.dart';
import 'constants.dart';

class CardGenerator extends StatelessWidget {
  CardGenerator(
      {@required this.name,
      @required this.totalcount,
      @required this.emptycount});

  final String name;
  final int totalcount;
  final int emptycount;

  @override
  Widget build(BuildContext context) {
    String tcount = totalcount.toString();
    String ecount = emptycount.toString();
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.add_location,
            color: kIconColour,
          ),
          Text("$name"),
          SizedBox(
            width: 80,
          ),
          Text("$ecount / $tcount"),
        ],
      ),
    );
  }
}
