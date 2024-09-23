import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //TODO:Set up default theme and color
    ThemeMode themeMode=ThemeMode.light;

    ColorSelection colorSelected=ColorSelection.deepPurple;

    //TODO:Add changeTheme above here
    void changeThemeMode(bool useLightMode){
      setState(() {
        themeMode=useLightMode?ThemeMode.light:ThemeMode.dark;
      });      
    }
    //TODO: Add changeColor above here
    void changeColor(int value){
      setState(() {
        colorSelected=ColorSelection.values[value];
      });
    }
  @override
  Widget build(BuildContext context) {
    const appTitle='My Restaurant';

    //TODO:Setup default theme
    
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,

      //TODO:Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
        changeTheme: changeThemeMode, changeColor: changeColor, colorSelected: colorSelected),

    );
}
}
