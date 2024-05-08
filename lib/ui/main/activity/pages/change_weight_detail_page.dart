import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../widgets/fat_tab.dart';
import '../widgets/muscle_mass_tab.dart';
import '../widgets/weight_tab.dart';

class ChangeWeightDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('체중 관리', style: TextStyle(color: TColor.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: TColor.white),
          bottom: TabBar(
            indicatorColor: TColor.white,
            labelColor: TColor.white,
            unselectedLabelColor: TColor.white,
            tabs: [
              Tab(text: '체중'),
              Tab(text: '체지방'),
              Tab(text: '근육량'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WeightTab(),
            FatTab(),
            MuscleMassTab(),
          ],
        ),
      ),
    );
  }
}
