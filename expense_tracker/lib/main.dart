import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import "package:expense_tracker/theme.dart";

void main() {
  runApp(
    MaterialApp(
      darkTheme: MyAppTheme.darkTheme,
      theme: MyAppTheme.lightTheme,
      themeMode: MyAppTheme.themeMode,
      home: const Expenses(),
    ),
  );
}
