import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
        color: HexColor('#6200EE')
    ),
    titleTextStyle: TextStyle(
      color: HexColor('#6200EE'),
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    actionsIconTheme: IconThemeData(
      color: HexColor('#6200EE'),
    ),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0.0,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('#6200EE'),
  ),
  // textTheme: TextTheme(
  //   bodyText1: TextStyle(
  //     fontSize: 18.0,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.black,
  //   ),
  // ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('#121212'),
  // primarySwatch: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
        color : HexColor('#BB86FC'),
    ),
    titleTextStyle: TextStyle(
      color: HexColor('#BB86FC'),
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    actionsIconTheme: IconThemeData(
      color: HexColor('#BB86FC'),
    ),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#121212'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('#121212'),
      elevation: 20.0,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('#BB86FC'),
  ),

  // textTheme: TextTheme(
  //   bodyText1: TextStyle(
  //     fontSize: 18.0,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.amber,
  //   ),
  // ),
);