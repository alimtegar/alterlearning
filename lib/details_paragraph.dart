import 'package:flutter/material.dart';

class DetailsParagraph extends StatefulWidget {
  DetailsParagraph({Key key, this.paragraph}) : super(key: key);

  final String paragraph;

  @override
  _DetailsParagraphState createState() => _DetailsParagraphState();
}

class _DetailsParagraphState extends State<DetailsParagraph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 24, bottom: 16, left: 24),
      child: Text(widget.paragraph, style: TextStyle(color: Color(0xFF4D5156)),),
    );
  }
}
