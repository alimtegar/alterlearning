import 'package:flutter/material.dart';

class DetailsHeading extends StatefulWidget {
  DetailsHeading({Key key, this.heading}) : super(key: key);

  final String heading;

  @override
  _DetailsHeadingState createState() => _DetailsHeadingState();
}

class _DetailsHeadingState extends State<DetailsHeading> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Color(0xFF1FC49A), width: 4))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            widget.heading,
            style: Theme.of(context).textTheme.headline6,
          ),
        ));
  }
}
