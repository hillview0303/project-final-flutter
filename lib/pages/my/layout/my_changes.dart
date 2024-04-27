import 'package:flutter/material.dart';

import '../../../data/models/chartDummy.dart';
import 'pysical_chart_scroll_view.dart';

class MyChanges extends StatefulWidget {
  const MyChanges({super.key});

  @override
  State<MyChanges> createState() => _MyChangesState();
}

class _MyChangesState extends State<MyChanges>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTabbar(),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          PysicalChartScrollView(
            chartData: fatData,
            dataName: "체지방",
            dataValue: 14.2,
            chartColor: Colors.red,
          ),
          PysicalChartScrollView(
            chartData: muscleData,
            dataName: "골격근",
            dataValue: 35.6,
            chartColor: Colors.blue,
          ),
          PysicalChartScrollView(
            chartData: fatData,
            dataName: "체중",
            dataValue: 76.7,
            chartColor: Colors.green,
          ),
        ],
      ),
    );
  }

  TabBar _buildTabbar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(child: Text("체지방")),
        Tab(child: Text("골격근")),
        Tab(child: Text("체중")),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }
}
