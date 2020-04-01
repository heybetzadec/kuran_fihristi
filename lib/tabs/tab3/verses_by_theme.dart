import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class VersesByTheme extends StatefulWidget {
  final RouteBus routeBus;
  final int themeId;
  final int phraseId;

  VersesByTheme({Key key, this.routeBus, this.themeId, this.phraseId}) : super(key: key);

  @override
  _VersesByThemeState createState() => _VersesByThemeState(routeBus, themeId, phraseId);
}

class _VersesByThemeState extends State<VersesByTheme> {
  final RouteBus routeBus;
  final int themeId;
  final int phraseId;

  _VersesByThemeState(this.routeBus, this.themeId, this.phraseId);

  var dataList = new List<Map<String, dynamic>>();

  @override
  void initState() {
    routeBus.dbf.then((db) {
      db
          .rawQuery(
          "SELECT v.ChapterID, v.VerseID, v.VerseText FROM VerseByPhrase AS vw " +
          "LEFT OUTER JOIN Verse AS v ON v.ChapterID = vw.ChapterID AND v.VerseID = vw.VerseID " +
      "WHERE vw.LangID=${routeBus.languageId} AND v.TranslationID=${routeBus.translationId} AND vw.ThemeID = $themeId AND vw.PhraseID =$phraseId;")
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
