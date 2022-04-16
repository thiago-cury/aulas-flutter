import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LocalJsonLocalization.delegate.directories = ['assets/language'];

    return MaterialApp(
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        // define pt_BR as default when de language code is 'pt'
        if (locale?.languageCode == 'pt') {
          return const Locale('pt', 'BR');
        }
        // default language
        return const Locale('en', 'US');
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        // Locale('es', 'ES'),
        Locale('pt', 'BR'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter - internacionalização'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 24)),
              Text('welcome-text'.i18n(), style: const TextStyle(fontSize: 24)),
              Text('home-text'.i18n(['João']), style: const TextStyle(fontSize: 24)),
              Text('home-full-text'.i18n(['João', 'Silva']), style: const TextStyle(fontSize: 24))
            ],
          ),
      ),
    );
  }
}
