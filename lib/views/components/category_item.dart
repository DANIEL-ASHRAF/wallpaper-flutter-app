import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({this.title, this.imageUrl, this.onTap});
 final String? imageUrl;
 final String? title;
 final Function()? onTap;
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    double width=100;
    return LayoutBuilder(
      builder: (context,constraints)=>
       InkWell(
         onTap: widget.onTap==null?(){}:widget.onTap,
         child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                height: constraints.maxHeight, width: width,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:widget.imageUrl!,
                  placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Positioned(
                child: Container(
                  height: constraints.maxHeight, width: width,
                  color: Colors.black38,
                  child: Center(
                    child: widget.title != null? Container(child:Text(widget.title!,style: TextStyle(color: Colors.white,fontSize: 14),)):
                    Container(child: Text("no image",style: TextStyle(color: Colors.white))),
                  ),
                ),
              )
            ],
          ),
      ),
       ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

