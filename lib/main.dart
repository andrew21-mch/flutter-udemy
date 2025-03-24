import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.greenAccent);
// add dark mode for green color scheme
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 15, 8),
  brightness: Brightness.dark,
  );

void main() {
  runApp(
    MaterialApp(
        // theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          scaffoldBackgroundColor: Colors.black,
          cardTheme: CardTheme().copyWith(
            color: kDarkColorScheme.primaryContainer,
            elevation: 4,),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: kColorScheme.primaryContainer,
            elevation: 4,
            shadowColor: kColorScheme.primary,
            margin: EdgeInsets.all(4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              
            )
          ),
          
        ),
        themeMode: ThemeMode.system,
        home: Expenses()),
  );
}
