import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_app/widget/sliverheader.dart';

class ImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //return _ImagePageState();
  }
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 180.0,
        child: Container(),
      ),
    );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}