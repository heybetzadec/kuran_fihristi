import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class VerseList extends StatefulWidget {
  final RouteBus routeBus;
  final int chapterId;

  VerseList({Key key, this.routeBus, this.chapterId}) : super(key: key);

  @override
  _VerseListState createState() => _VerseListState(routeBus, chapterId);
}

class _VerseListState extends State<VerseList> {
  final RouteBus routeBus;
  final int chapterId;

  _VerseListState(this.routeBus, this.chapterId);

  var dataList = new List<Map<String, dynamic>>();

  @override
  void initState() {
    routeBus.dbf.then((db) {
      db
          .rawQuery(
              "SELECT VerseID, VerseText  FROM Verse WHERE TranslationID=${routeBus.translationId} AND ChapterID=$chapterId;")
          .then((value) {
        setState(() {
          dataList = value.toList();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Sura',
        appBar: AppBar(),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 2),
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            var itemValue = dataList[index].values;
            return new Card(
              margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              elevation: 1,
              child: new InkWell(
                onTap: () {
                  print('on tap');
                },
                child: ListTile(
                  title: Text('${itemValue.first}. ${itemValue.last}'),
                ),
              ),
//                color: Colors.transparent,
            );
          },
        ),
      ),
    );

  }
}
