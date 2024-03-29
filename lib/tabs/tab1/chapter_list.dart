import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/const.dart';
import 'package:kuranfihristi/help/event_key.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/help/translations.dart';
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
  var searchList = new List<Map<String, dynamic>>();
  var translate = new Map<dynamic, dynamic>();
  FocusNode searchFocusNode;
  TextEditingController searchController = new TextEditingController();
  bool searchFocus = false;
  ScrollController scrollController;

  @override
  void initState() {
    searchFocusNode = FocusNode();
    scrollController = ScrollController();

    routeBus.dbf.then((db) {
      db
          .rawQuery(
              "SELECT ChapterID, ChapterName  FROM Chapter WHERE TranslationID=${routeBus.translationId} ORDER BY ChapterID;")
          .then((value) {
        setState(() {
          dataList = value.toList();
          searchList = dataList;
        });
      });
    });

    routeBus.eventBus.on<ChapterClickEvent>().listen((event) {
      searchFocusNode.unfocus();
      searchController.clear();
      setState(() {
        searchList = dataList;
      });
    });

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (!visible) {
          searchFocusNode.unfocus();
          searchFocus = false;
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchFocusNode.addListener(() {
      setState(() {
        searchFocus = searchFocusNode.hasFocus;
      });
    });

    return Scaffold(
      appBar: BaseAppBar(
        title: Translations.of(context).text("chapters"),
        appBar: AppBar(),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            flexibleSpace: Container(
              margin: EdgeInsets.only(
                top: 4,
              ),
              child: TextField(
                controller: searchController,
                autofocus: false,
                autocorrect: false,
                textInputAction: TextInputAction.search,
                focusNode: searchFocusNode,
                onChanged: (value) {
                  var from = ['ə', 'ç', 'ş', 'ü', 'ğ', ' '];
                  var change = ['e', 'c', 's', 'u', 'g', '-'];
                  if (routeBus.translationId == 121) {
                    value = replaceAll(value, from, change);
                  }
                  var searched = new List<Map<String, dynamic>>();

                  dataList.forEach((element) {
                    String item =
                    element.values.last.toString().toLowerCase();
                    if (routeBus.translationId == 121) {
                      item = replaceAll(item, from, change);
                    }
                    if (item.contains(value.toLowerCase())) {
                      setState(() {
                        searched.add(element);
                      });
                    }
                  });

                  setState(() {
                    searchList = searched;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Səhifədə axtar...',
                    contentPadding: EdgeInsets.all(15),
                    suffixIcon: getSearchSuffix(searchFocus),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    fillColor: Colors.red),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                var itemValue = searchList[index].values;
                return new Card(
                  margin:
                  EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  elevation: 1,
                  child: new InkWell(
                    onTap: () {
                      searchFocusNode.unfocus();
                      Navigator.of(context).push(Const.customRoute((context) {
                        return VerseList(
                          routeBus: routeBus,
                          chapterId: itemValue.first,
                        );
                      })).then((value) {
                        searchController.clear();
                        setState(() {
                          searchList = dataList;
                        });
                      });
                    },
                    child: ListTile(
                      title: Text(
                        '${itemValue.first}. ${itemValue.last}',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
//                    child: Container(
//                      padding: EdgeInsets.only(
//                        left: 20,
//                        right: 20
//                      ),
//                      height: 40,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                              '${itemValue.first}. ${itemValue.last}',
//                            style: TextStyle(
//                              fontSize: 18
//                            ),
//                          ),
//                          Icon(
//                            Icons.arrow_forward_ios,
//                            size: 18,
//                          )
//                        ],
//                      ),
//                    ),
                  ),
                );
              },
              childCount: searchList.length,
            ),
          ),
        ],
      ),
    );
  }

  getSearchSuffix(bool isFocus) {
    if (isFocus) {
      return IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (searchController.text.length == 0) {
              searchFocusNode.unfocus();
            } else {
              searchController.clear();
            }
            setState(() {
              searchList = dataList;
            });
          });
    } else {
      return Icon(
        Icons.search,
        size: 40,
        color: Colors.black26,
      );
    }
  }

  String replaceAll(String item, List<String> from, List<String> change) {
    for (var i = 0; i < from.length; i++) {
      item = item.replaceAll(from[i], change[i]);
    }
    return item;
  }
}
