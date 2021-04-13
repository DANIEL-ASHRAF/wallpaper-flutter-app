import 'package:flutter/material.dart';
import '../ui_helpers.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({
    Key? key,
    this.title = 'Nothing here',
    this.message = 'Add a new item to get started', this.textColor:Colors.grey,
  }) : super(key: key);
  final String title;
  final String message;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,textScaleFactor: 1,
              style: TextStyle( fontSize: screenWidth(context)*.09,
                   color: textColor, fontWeight: FontWeight.bold),
            ),
            Text(
              message,textScaleFactor: 1,
              style: TextStyle(fontSize: screenWidth(context)*.07, color: textColor,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
