import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/detail_page.dart';
import 'package:kuranfihristi/tabs/controller/list_page.dart';
import 'package:kuranfihristi/tabs/controller/bottom_navigation.dart';


class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    print('tabItem -> ${tabItem}');
    return {
      TabNavigatorRoutes.root: (context) => ListPage(
        color: activeTabColor[tabItem],
        title: tabName[tabItem],
        onPush: (materialIndex) =>
            _push(context, materialIndex: materialIndex),
      ),
      TabNavigatorRoutes.detail: (context) => DetailPage(
        color: activeTabColor[tabItem],
        title: tabName[tabItem],
        materialIndex: materialIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}