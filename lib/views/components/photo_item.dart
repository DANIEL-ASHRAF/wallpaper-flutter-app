import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatefulWidget  {
  PhotoItem({required this.imageUrl,required this.onTap});
  final String? imageUrl;
  final Function()? onTap;

  @override
  _PhotoItemState createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints)=>
          InkWell(
            onTap: widget.onTap==null?(){}:widget.onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:widget.imageUrl!,
                placeholder: (context, url) => Container(
                    height: constraints.minHeight,width: constraints.maxWidth,
                    child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
