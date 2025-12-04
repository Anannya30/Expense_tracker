import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181),);

var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark, Color.fromARGB(255, 5, 99, 125),);
void main(){
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme:kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal:16 , vertical: 8 ),
        ),
      ),
      theme: ThemeData(
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal:16 , vertical: 8 ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme().copyWith(
           titleLarge: TextStyle(
            fontWeight: FontWeight.bold , 
            color:kColorScheme.secondaryContainer , 
            fontSize: 16,
          ),
        )
      ).copyWith(),
      themeMode: ThemeMode.system,
      home:Expenses(),
    ),
  );
}