import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/event_key.dart';
import 'package:kuranfihristi/help/translations.dart';
import 'package:kuranfihristi/help/locale_util.dart';
import 'package:kuranfihristi/tabs/controller/app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Main());
}

//class MyApp extends StatelessWidget {
//
//  EventBus eventBus = new EventBus();
//
//  @override
//  Widget build(BuildContext context) {
//    var lang = 'tr';
//    eventBus.on<RootAppEvent>().listen((event) {
//      lang = event.value;
//      print('root event -> $lang');
//    });
//    return MaterialApp(
//      localizationsDelegates: [
//        const TranslationsDelegate(),
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      locale: Locale(lang),
//      supportedLocales: localeUtil.supportedLocales(),
//      localeResolutionCallback:
//          (Locale locale, Iterable<Locale> supportedLocales) {
//        //print("change language");
//        return locale;
//      },
////      supportedLocales: const <Locale>[const Locale('az')],
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: App(eventBus: eventBus,),
//    );
//  }
//}


class Main extends StatefulWidget {

  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  _MainState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('az'),
      supportedLocales: localeUtil.supportedLocales(),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
