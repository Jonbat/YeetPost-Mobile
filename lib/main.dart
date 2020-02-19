import 'location.dart';
import 'trending.dart';
import 'profile.dart';
import 'writeYeet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "YeetPost",
  theme: ThemeData(
    // update font later
    // String fontFamily : ,
    focusColor: Color(0xFF21BFBD),
    hoverColor: Color(0xFF21BFBD),
    highlightColor: Color(0xFF21BFBD),
    buttonColor: Color(0xFF21BFBD),
    textSelectionColor: Color(0xFF21BFBD),
    textSelectionHandleColor: Color(0xFF21BFBD),
    //primaryColor:  Color(0xFF21BFBD),
    //accentColor: Colors.white,
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
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
      flexibleSpace: SafeArea(child: getTabBar(), ),
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
      ]
    );
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, 
      children: <Widget>[
      LocationPage(),
      TrendingPage(),
      ProfilePage(),
      WriteYeetPage(),
    ]);
  }
}
