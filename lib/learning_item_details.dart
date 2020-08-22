import 'package:alterlearning/details_heading.dart';
import 'package:alterlearning/details_paragraph.dart';
import 'package:flutter/material.dart';

class LearningItemDetails extends StatefulWidget {
  LearningItemDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LearningItemDetailsState createState() => _LearningItemDetailsState();
}

class _LearningItemDetailsState extends State<LearningItemDetails> {
  String _title;
  ThemeData _themData;

  @override
  void initState() {
    _title = widget.title;
    _themData = Theme.of(context).copyWith(accentColor: Colors.white);

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
                child: Image.network('https://picsum.photos/id/1074/500/300'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsHeading(heading: 'About Animal',),
                    DetailsParagraph(paragraph: 'Animals (also called Metazoa) are multicellular eukaryotic organisms that form the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, are able to move, can reproduce sexually, and grow from a hollow sphere of cells, the blastula, during embryonic development',),
                    DetailsHeading(heading: 'Characteristics',),
                    DetailsParagraph(paragraph: 'Animals have several characteristics that set them apart from other living things. Animals are eukaryotic and multicellular, unlike bacteria, which are prokaryotic, and unlike protists, which are eukaryotic but unicellular.',),
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
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          tooltip: 'Back',
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          )
        ],
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
