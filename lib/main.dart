import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pooyam_vettu/screens/game_board.dart';
import 'package:pooyam_vettu/screens/gameconfig.dart';
import 'package:pooyam_vettu/screens/playernames.dart';
import 'package:pooyam_vettu/screens/splash.dart';
import 'package:pooyam_vettu/screens/winner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.amitaTextTheme(),
      ),
      initialRoute: SplashScreen.id,
      color: Colors.black,
      routes: {
        GameBoard.id: (context) => GameBoard(),
        SplashScreen.id: (context) => SplashScreen(),
        GameConfig.id: (context) => GameConfig(),
        PlayerList.id: (context) => PlayerList(),
        Winner.id: (context) => Winner(),

      },
    );
  }
}
