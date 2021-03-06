import 'package:alterlearning/learning_item_details.dart';
import 'package:flutter/material.dart';

class LearningItem extends StatefulWidget {
  LearningItem({Key key, this.id, this.title, this.description, this.image})
      : super(key: key);

  final int id;
  final String title;
  final String description;
  final String image;

  @override
  _LearningItemState createState() => _LearningItemState();
}

class _LearningItemState extends State<LearningItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1FC49A),
      margin: EdgeInsets.only(top: 0, right: 0, bottom: 8, left: 0),
      shape: Border(left: BorderSide(color: Color(0xFF1FC49A), width: 4)),
      child: Row(children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 27,
                  backgroundImage: NetworkImage(widget.image),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Text(widget.description, style: TextStyle(color: Color(0xFF4D5156)),),
              ),
            ),
          ),
        ),
        IconButton(
            color: Colors.white,
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LearningItemDetails(
                          id: widget.id, title: widget.title)));
            }),
        // ),
      ]),
    );
  }
}
