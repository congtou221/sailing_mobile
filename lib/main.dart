import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'common/global.dart';
import 'routes/courseware_page/index.dart';
import 'routes/home_page/index.dart';
import 'routes/team_page/index.dart';
import 'states/index.dart';

void main() {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeModel()),
          ChangeNotifierProvider(create: (context) => UserModel()),
        ],
        child: Consumer2<ThemeModel, UserModel>(
            builder: (BuildContext context, themeModel, userModel, child) {
          return MaterialApp(
              theme: Global.themes['light'],
              darkTheme: Global.themes['dark'],
              themeMode: ThemeMode.system,
              home: const PaperHomePage(),
              routes: <String, WidgetBuilder>{
                // 注册路由表
                '/paper/home': (context) => const PaperHomePage(),

                '/courseware/home': (context) => const CoursewareHomePage(),

                '/team/home': (context) => const TeamHomePage(),
              });
        }));
  }
}
