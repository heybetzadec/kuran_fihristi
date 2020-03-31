import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/controller/bottom_navigation.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';
import 'package:kuranfihristi/tabs/tab1/chapter_list.dart';
import 'package:kuranfihristi/tabs/tab2/letter_list.dart';
import 'package:kuranfihristi/tabs/tab3/theme_list.dart';
import 'package:kuranfihristi/tabs/tab4/name_list.dart';
import 'package:kuranfihristi/tabs/tab5/other.dart';

class TabPages extends StatelessWidget {
  final String title;
  final ValueChanged<ForRoute> onPush;
//  final EventBus eventBus;
  final TabItem tabItem;
  final RouteBus routeBus;

  TabPages({this.title, this.onPush, this.tabItem, this.routeBus});


  Widget widgetTab;

//  _buildItem(tabItem: TabItem.chapter),
//  _buildItem(tabItem: TabItem.words),
//  _buildItem(tabItem: TabItem.theme),
//  _buildItem(tabItem: TabItem.names),
//  _buildItem(tabItem: TabItem.other),

  @override
  Widget build(BuildContext context) {
    switch (tabItem) {
      case TabItem.chapter:
        {
          widgetTab = ChapterList(
            routeBus: routeBus,
          );
        }
        break;
      case TabItem.words:
        {
          widgetTab = LetterList(
            onPush: onPush,
//            eventBus: eventBus,
          );
        }
        break;
      case TabItem.theme:
        {
          widgetTab = ThemeList(
            onPush: onPush,
//            eventBus: eventBus,
          );
        }
        break;
      case TabItem.names:
        {
          widgetTab = NameList(
            onPush: onPush,
//            eventBus: eventBus,
          );
        }
        break;
      case TabItem.other:
        {
          widgetTab = Other(
            onPush: onPush,
//            eventBus: eventBus,
          );
        }
        break;
      default:
        {
          widgetTab = ChapterList(
            routeBus: routeBus,
          );
        }
        break;
    }
    return Scaffold(body: widgetTab);
  }
}
