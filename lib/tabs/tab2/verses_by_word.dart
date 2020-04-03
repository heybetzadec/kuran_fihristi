import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class VersesByWord extends StatefulWidget {
  final RouteBus routeBus;
  final int letterId;
  final int wordId;

  VersesByWord({Key key, this.routeBus, this.letterId, this.wordId}) : super(key: key);

  @override
  _VersesByWordState createState() => _VersesByWordState(routeBus, letterId, wordId);
}

class _VersesByWordState extends State<VersesByWord> {
  final RouteBus routeBus;
  final int letterId;
  final int wordId;

  _VersesByWordState(this.routeBus, this.letterId, this.wordId);

  var dataList = new List<Map<String, dynamic>>();

  @override
  void initState() {
    routeBus.dbf.then((db) {
      db
          .rawQuery(
          "SELECT v.ChapterID, v.VerseID, v.VerseText FROM VerseByWord AS vw "
              "LEFT OUTER JOIN Verse AS v ON v.ChapterID = vw.ChapterID AND v.VerseID = vw.VerseID "
              "WHERE vw.LangID=${routeBus.languageId} AND v.TranslationID=${routeBus.translationId} AND vw.LetterID = $letterId AND vw.WordId =$wordId;")
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
            var itemValue = dataList[index].values.toList();
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
                  title: Text('${itemValue.first}:${itemValue[1]}. ${itemValue.last}'),
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}
