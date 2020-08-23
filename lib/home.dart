import 'package:alterlearning/learning_list.dart';
import 'package:flutter/material.dart';
import 'package:alterlearning/learning_item.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String query = '';

  List<Map<String, dynamic>> list;
  List<Map<String, dynamic>> filteredList;

  @override
  void initState() {
    super.initState();

    list = LearningList.learningList;
  }

  _HomeState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearching = false;
          query = '';
        });
      } else {
        setState(() {
          isSearching = true;
          query = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: null,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.menu),
        //     tooltip: 'Menu',
        //     onPressed: () {},
        //   )
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 15, bottom: 15, left: 15),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
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
      body: !isSearching ? _buildListView() : _performSearch(),
    );
  }

  Widget _buildListView() {
    return ListView(
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) => LearningItem(
                      id: list[index]['id'],
                      title: list[index]['title'],
                      image: list[index]['image'],
                      description: list[index]['description'],
                    ))),
      ],
    );
  }

  Widget _performSearch() {
    filteredList = list
        .where((i) =>
            i['title'].toLowerCase().contains(query.toLowerCase()) ||
            i['content'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildFilteredListView();
  }

  Widget _buildFilteredListView() {
    return ListView(
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (BuildContext context, int index) => LearningItem(
                      id: filteredList[index]['id'],
                      title: filteredList[index]['title'],
                      image: filteredList[index]['image'],
                      description: filteredList[index]['description'],
                    ))),
      ],
    );
  }
}
