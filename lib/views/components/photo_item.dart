import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatefulWidget  {
  PhotoItem({required this.imageUrl});
  final String? imageUrl;

  @override
  _PhotoItemState createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints)=>
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:widget.imageUrl!,
              placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
