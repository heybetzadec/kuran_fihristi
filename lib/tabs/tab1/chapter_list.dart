import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/const.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/tab1/verse_list.dart';

class ChapterList extends StatefulWidget {
  final RouteBus routeBus;

  ChapterList({Key key, this.routeBus}) : super(key: key);

  @override
  _ChapterListState createState() => _ChapterListState(routeBus);
}

class _ChapterListState extends State<ChapterList> {
  final RouteBus routeBus;

  _ChapterListState(this.routeBus);

  var dataList = new List<Map<String, dynamic>>();


  @override
  void initState() {
    routeBus.dbf.then((db) {
      db.rawQuery("SELECT ChapterID, ChapterName  FROM Chapter WHERE TranslationID=${routeBus.translationId} ORDER BY ChapterID;").then((value) {
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
        margin: EdgeInsets.only(
          top: 2
        ),
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            var itemValue = dataList[index].values;
            return new Card(
              margin: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 1
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              elevation: 1,
              child: new InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      Const.customRoute((context) {
                        return VerseList(
                          routeBus: routeBus,
                          chapterId: itemValue.first,
                        );
                      })
                  );
                },
                child: ListTile(
                  title: Text('${itemValue.first}. ${itemValue.last}'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
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
