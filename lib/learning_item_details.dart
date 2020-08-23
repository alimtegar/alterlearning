import 'package:alterlearning/details_heading.dart';
import 'package:alterlearning/details_paragraph.dart';
import 'package:alterlearning/learning_list.dart';
import 'package:flutter/material.dart';

class LearningItemDetails extends StatefulWidget {
  LearningItemDetails({Key key, this.id, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _LearningItemDetailsState createState() => _LearningItemDetailsState();
}

class _LearningItemDetailsState extends State<LearningItemDetails> {
  Map<String, dynamic> _learningItem;

  @override
  void initState() {
    _learningItem =
        LearningList.learningList.firstWhere((i) => i['id'] == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(
      children: [
        _buildBackground(),
        _buildCard(),
      ],
    ));
  }

  Widget _buildCard() {
    return Positioned(
      top: AppBar().preferredSize.height,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.only(top: 24, right: 16, bottom: 8, left: 16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(_learningItem['image_lg']),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsHeading(
                      heading: 'About ' + _learningItem['title'],
                    ),
                    DetailsParagraph(
                      paragraph: _learningItem['content'],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1FC49A),
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     tooltip: 'Menu',
        //     onPressed: () {},
        //   )
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 15, bottom: 15, left: 15),
                child: null,
              )),
        ),
      ),
    );
  }
}
