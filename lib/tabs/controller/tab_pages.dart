import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/bottom_navigation.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';
import 'package:kuranfihristi/tabs/tab1/chapter_list.dart';
import 'package:kuranfihristi/tabs/tab2/letter_list.dart';
import 'package:kuranfihristi/tabs/tab3/theme_list.dart';
import 'package:kuranfihristi/tabs/tab4/name_list.dart';
import 'package:kuranfihristi/tabs/tab5/other.dart';

class TabPages extends StatelessWidget {
  TabPages({this.title, this.onPush, this.tabItem, this.eventBus});

  final String title;
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;
  final TabItem tabItem;
  Widget widgetTab;

//  _buildItem(tabItem: TabItem.sura),
//  _buildItem(tabItem: TabItem.words),
//  _buildItem(tabItem: TabItem.theme),
//  _buildItem(tabItem: TabItem.names),
//  _buildItem(tabItem: TabItem.other),


  @override
  Widget build(BuildContext context) {
    switch (tabItem) {
      case TabItem.sura:
        {
          widgetTab =  ChapterList(onPush: onPush, eventBus: eventBus,);
        }
        break;
      case TabItem.words:
        {
          widgetTab = LetterList(onPush: onPush, eventBus: eventBus,);
        }
        break;
      case TabItem.theme:
        {
          widgetTab = ThemeList(onPush: onPush, eventBus: eventBus,);
        }
        break;
      case TabItem.names:
        {
          widgetTab = NameList(onPush: onPush, eventBus: eventBus,);
        }
        break;
      case TabItem.other:
        {
          widgetTab = Other(onPush: onPush, eventBus: eventBus,);
        }
        break;
      default:
        {
          widgetTab = ChapterList(onPush: onPush, eventBus: eventBus,);
        }
        break;
    }
    return Scaffold(body: widgetTab);
  }

}
