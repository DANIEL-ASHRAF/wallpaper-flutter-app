import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

//class ListItemsBuilder<T> extends StatelessWidget {
//  const ListItemsBuilder({
//    Key key,
//    @required this.snapshot,
//    @required this.itemBuilder,
//  }) : super(key: key);
//  final AsyncSnapshot<List<T>> snapshot;
//  final ItemWidgetBuilder<T> itemBuilder;
//
//  @override
//  Widget build(BuildContext context) {
//    if (snapshot.hasData) {
//      final List<T> items = snapshot.data;
//      if (items.isNotEmpty) {
//        return _buildList(items);
//      } else {
//        return EmptyContent();
//      }
//    } else if (snapshot.hasError) {
//      return EmptyContent(
//        title: 'Something went wrong',
//        message: 'Can\'t load items right now',
//      );
//    }
//    return Center(child: CircularProgressIndicator());
//  }
//
//  Widget _buildList(List<T> items) {
//    return ListView.separated(
//      itemCount: items.length + 2,
//      separatorBuilder: (context, index) => Divider(height: 0.5),
//      itemBuilder: (context, index) {
//        if (index == 0 || index == items.length + 1) {
//          return Container();
//        }
//        return itemBuilder(context, items[index - 1]);
//      },
//    );
//  }
//}

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection:Axis.horizontal,
    this.horizontalPadding:10,
    this.verticalPadding:10

  }) : super(key: key);
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final Axis scrollDirection;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return _buildList(items);
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal:horizontalPadding,vertical: verticalPadding),
      scrollDirection: scrollDirection,
      itemCount: items.length,
      separatorBuilder: (context, index) =>
      scrollDirection==Axis.horizontal? Container(width: horizontalPadding):Container(height:verticalPadding),
      itemBuilder: (context, index) => itemBuilder(context, items[index])
    );
  }
}

class GridItemsBuilder<T> extends StatelessWidget {
  const GridItemsBuilder({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection:Axis.horizontal,
    this.horizontalPadding:10,
    this.verticalPadding:10,
    this.crossAxisCount:2

  }) : super(key: key);
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final Axis scrollDirection;
  final double horizontalPadding;
  final double verticalPadding;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return _buildList(items);
  }

  Widget _buildList(List<T> items) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal:horizontalPadding,vertical: verticalPadding),
        scrollDirection: scrollDirection,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20
        ),
      itemBuilder: (context, index) => itemBuilder(context, items[index]),

    );
  }
}