import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.title, this.imageUrl});
 final String? imageUrl;
 final String? title;
  @override
  Widget build(BuildContext context) {
    double width=100;
    return LayoutBuilder(
      builder: (context,constraints)=>
       ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: constraints.maxHeight, width: width,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:imageUrl!,
                placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              child: Container(
                height: constraints.maxHeight, width: width,
                color: Colors.black38,
                child: Center(
                  child: title != null? Container(child:Text(title!,style: TextStyle(color: Colors.white,fontSize: 14),)):
                  Container(child: Text("no image",style: TextStyle(color: Colors.white))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotoItem extends StatelessWidget {
  PhotoItem({required this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints)=>
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:imageUrl!,
              placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
    );
  }
}
