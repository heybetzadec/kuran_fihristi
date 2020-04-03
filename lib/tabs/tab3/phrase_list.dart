import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/const.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/tab3/verses_by_theme.dart';
import 'package:tinycolor/tinycolor.dart';

class PhraseList extends StatefulWidget {
  final RouteBus routeBus;
  final int themeId;

  PhraseList({Key key, this.routeBus, this.themeId}) : super(key: key);

  @override
  _PhraseListState createState() => _PhraseListState(routeBus, themeId);
}

class _PhraseListState extends State<PhraseList> {
  final RouteBus routeBus;
  final int themeId;

  _PhraseListState(this.routeBus, this.themeId);

  var dataList = new List<Map<String, dynamic>>();

  @override
  void initState() {
    routeBus.dbf.then((db) {
      db
          .rawQuery(
          "SELECT PhraseID, PhraseName FROM Phrase WHERE LangID=${routeBus.languageId} AND ThemeID = $themeId;")
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
                  Navigator.of(context).push(
                      Const.customRoute((context) {
                        return VersesByTheme(
                          routeBus: routeBus,
                          themeId: themeId,
                          phraseId: itemValue.first,
                        );
                      })
                  );
                },
                child: ListTile(
                  title: Text('${itemValue.last}'),
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
