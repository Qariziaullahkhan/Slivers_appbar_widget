import 'package:flutter/material.dart';

class SliversAppbarScreen extends StatefulWidget {
  const SliversAppbarScreen({super.key});

  @override
  State<SliversAppbarScreen> createState() => _SliversAppbarScreenState();
}

class _SliversAppbarScreenState extends State<SliversAppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: DefaultTabController(
    length: 3,
    child: NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title:const  Text('Goa', textScaleFactor: 1),
              background: Image.asset(
                'assets/images/beach.png',
                fit: BoxFit.fill,
              ),
              stretchModes: [StretchMode.zoomBackground],
            ),
            //collapsedHeight: 100,
          ),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
          const   TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.flight)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_car)),
                ],
              ),
            ),
            pinned: false,
          ),
        ];
      },
      body: const TabBarView(
        children: [
          Icon(Icons.flight, size: 350),
          Icon(Icons.directions_transit, size: 350),
          Icon(Icons.directions_car, size: 350),
        ],
      ),
    ),
  ),
);
  }
}
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MySliverPersistentHeaderDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}