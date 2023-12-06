import 'package:flutter/material.dart';
import 'package:mctvadminweb/Pages/moviespage.dart';
import 'package:mctvadminweb/Pages/seriespage.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int selectedIndex = 0;

  final _pages = [
    const MoviePage(),
    const SeriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _pages.length,
        child: Scaffold(
          body: Column(
            children: [
              const TabBar(tabs: [
                Tab(
                  child: Text(
                    'Movie',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    'Series',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ]),
              Expanded(child: TabBarView(children: _pages))
            ],
          ),
        ));
  }
}
