import 'package:flutter/material.dart';
import 'package:alterlearning/learning_item.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 15, bottom: 15, left: 15),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type here to search item...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(15)),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  //   textAlignVertical: TextAlignVertical.center,
                  onChanged: null,
                ),
              )),
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'List to Learn',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  'Choose subject below to learn it',
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            // shrinkWrap: true,
            children: <Widget>[
              LearningItem(
                  title: 'Animal',
                  description:
                      'Animals (also called Metazoa) are multicellular eukaryotic ...',
                  image: 'https://picsum.photos/id/1074/75/75'),
              LearningItem(
                  title: 'Plant',
                  description:
                      'Plants are mainly multicellular organisms, predominantly ...',
                  image: 'https://picsum.photos/id/28/75/75'),
              LearningItem(
                  title: 'Fungi',
                  description:
                      'A fungus is any member of the group of eukaryotic organisms ...',
                  image: 'https://picsum.photos/id/292/75/75'),
              LearningItem(
                  title: 'Bacteria',
                  description:
                      'Bacteria are a type of biological cell. They constitute a large ...',
                  image: 'https://picsum.photos/id/253/75/75'),
            ],
          )),
        ],
      ),
    );
  }
}
