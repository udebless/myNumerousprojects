import 'package:flutter/material.dart';
import 'package:myprojects/flutter_maps/simple_google_map/quakes_map_app/quakes_app.dart';
import 'package:myprojects/flutter_maps/simple_google_map/showMap.dart';
import 'package:myprojects/parsin_json/json_parsing.dart';
import 'package:myprojects/ui/mortgage_app.dart';
import 'package:myprojects/weather_forecast/weather_forecast.dart';

import 'board_firestore/board_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/home.dart';

// final ThemeData _appTheme = _buildAppTheme();

// ThemeData _buildAppTheme() {
//   final ThemeData base = ThemeData.dark();
//   return base.copyWith(
//       brightness: Brightness.dark,
//       accentColor: Colors.amber,
//       primaryColor: Colors.green,
//       scaffoldBackgroundColor: Colors.orange,
//       cardColor: Colors.indigo,
//       backgroundColor: Colors.blue,
//       inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent),
//         borderRadius: BorderRadius.circular(12),
//         )
//       ),
//       floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
//         elevation: 7,
//         splashColor: Colors.purple,
//         backgroundColor: Colors.green,
//       ),
//       dividerColor: Colors.pink,
//       textTheme:_appTextTheme(base.textTheme)
//          );
// }

// TextTheme _appTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline5: base.headline5.copyWith(
//       fontWeight: FontWeight.w500,

//     ),
//     headline6: base.headline6.copyWith(
//       fontSize: 18.0

//     ) ,
//     caption: base.caption.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize:14.0,

//     ),

//     button:  base.button.copyWith(
//     //  letterSpacing:3.0,
//     //  fontSize: 23.9,
//     //  backgroundColor: Colors.red,
//        // fontFamily: 'Lobster'
//     ),
//     bodyText2: base.bodyText2.copyWith(
//       fontSize: 16.9, color: Colors.white,
//      // fontFamily: 'Lobster'

//     ).apply(
//       fontFamily: 'Lobster'
//     )
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: _appTheme,

      // theme: ThemeData(
      //     brightness: Brightness.dark,
      //     primaryColor: Colors.lightBlue[800],
      //     textTheme: TextTheme(
      //       headline5: TextStyle(
      //         fontSize: 34,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       bodyText2: TextStyle(
      //         fontSize: 16.9,
      //         color: Colors.white,
      //       ),
      //     )),
      home: BoardApp(),
    );
  }
}
