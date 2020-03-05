import 'location.dart';
import 'trending.dart';
import 'profile.dart';
import 'writeYeet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarWrapper extends StatefulWidget {
  @override
  AppBarWrapperState createState() => AppBarWrapperState();
}

class AppBarWrapperState extends State<AppBarWrapper> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /* 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        */
        elevation: 0.0, // no shadow
        backgroundColor: Color(0xFF21BFBD),
        flexibleSpace: SafeArea(
          child: getTabBar(),
        ),
      ),
      body: getTabBarPages());
  }

  Widget getTabBar() {
    return TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.white,
        tabs: [
          Tab(icon: Icon(Icons.home, size: 30.0)),
          Tab(icon: Icon(Icons.trending_up, size: 30.0)),
          Tab(icon: Icon(Icons.person_outline, size: 30.0)),
          Tab(icon: Icon(Icons.create, size: 30.0)),
        ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      Location(),
      Trending(),
      Profile(),
      WriteYeet(),
    ]);
  }
}
