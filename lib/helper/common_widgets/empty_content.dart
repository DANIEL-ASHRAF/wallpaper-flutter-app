import 'package:flutter/material.dart';
import '../ui_helpers.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({
    Key? key,
    this.title = 'Nothing here',
    this.message = 'Add a new item to get started', this.titleTextColor:Colors.grey,
    this.subTitleTextColor:Colors.grey, this.justTitle:false,
  }) : super(key: key);
  final String title;
  final String message;
  final Color? titleTextColor;
  final Color? subTitleTextColor;
  final bool justTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,textScaleFactor: 1,
            style: TextStyle( fontSize: screenWidth(context)*.09,
                 color: titleTextColor, fontWeight: FontWeight.bold),
          ),
        justTitle?Container():Text(
            message,textScaleFactor: 1,
            style: TextStyle(fontSize: screenWidth(context)*.07, color: subTitleTextColor,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
