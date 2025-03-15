import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey
            ),
            fillColor: Colors.white,
            filled: true,
            border: _getZeroBorder(),
            enabledBorder: _getZeroBorder(),
            errorBorder: _getZeroBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
        ),
        textTheme: TextTheme(
            titleLarge: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600)
        )
        ),
      home: const SplashScreen(),
    );
  }
  OutlineInputBorder _getZeroBorder(){
    return OutlineInputBorder(
        borderSide: BorderSide.none
    );
  }
}
