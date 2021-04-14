import 'package:flutter/material.dart';

const Color whiteColor=Colors.white;

const Color errorColor= Color(0xFFF36D6F);

const Color backgroundColor=Color(0xFFE2F1FF);
const Color blueColor=Color(0xFF4680CF);
const Color lightBlueColor= Color(0xFF83B4FF);
const Color greyColor= Color(0xFFEcF0F1);

ThemeData normalMode= ThemeData(
        primaryColor: blueColor,
        accentColor: lightBlueColor,
        backgroundColor: backgroundColor,
        textTheme: TextTheme(
                bodyText1:TextStyle(color:blueColor,fontSize: 22,fontWeight: FontWeight.bold),
                bodyText2:TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
        ),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: lightBlueColor,
            selectionHandleColor:blueColor
        ),
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
);
