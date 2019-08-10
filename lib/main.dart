import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_flutter/app_config.dart';
import 'package:movies_flutter/repository/movie_repository.dart';
import 'package:movies_flutter/screens/movie_detail.dart';
import 'package:movies_flutter/style.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Movies Flutter',
    flavorName: 'production',
    apiBaseUrl: 'https://api.themoviedb.org/3/',
    apiKey: '21ab19da35c8481721c284f94bd95e49',
    child: MyApp(),
  );

  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);
    return MaterialApp(
      title: config.appName,
      theme: _theme(),
      home: MovieDetail(
          movie: MovieRepository(config.apiBaseUrl, config.apiKey)
              .fetchById(11340)),
    );
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        textTheme: TextTheme(
            title: MainTitleTextStyle, display1: Display1, display2: Display2));
  }
}
