import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key,required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height ,
        width:MediaQuery.of(context).size.width ,
        child: Image.network(imageUrl,fit: BoxFit.cover,),
      ),
    );
  }
}
