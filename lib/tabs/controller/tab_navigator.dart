import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/const.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/controller/bottom_navigation.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';
import 'package:kuranfihristi/tabs/controller/tab_pages.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.routeBus});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
//  final EventBus eventBus;
  final RouteBus routeBus;

  void _push(BuildContext context, {ForRoute forRoute}) {
    var routeBuilders = _routeBuilders(context, forRoute: forRoute);
    Navigator.push(context,
        Const.customRoute((context) => routeBuilders[forRoute.route](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {ForRoute forRoute}) {
    return {
      TabNavigatorRoutes.root: (context) => TabPages(
            title: tabName[tabItem],
            tabItem: tabItem,
            routeBus: routeBus,
            onPush: (forRoute) => _push(context, forRoute: forRoute),
          ),
      TabNavigatorRoutes.detail: (context) => forRoute.widget,
    };

//    return {
//      TabNavigatorRoutes.root: (context) {
//        return ListPage(
//          color: activeTabColor[tabItem],
//          title: tabName[tabItem],
//          onPush: (materialIndex) =>
//              _push(context, materialIndex: materialIndex),
//        );
//      },
//      TabNavigatorRoutes.detail: (context) => DetailPage(
//        color: activeTabColor[tabItem],
//        title: tabName[tabItem],
//        materialIndex: materialIndex,
//      ),
//    };
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
