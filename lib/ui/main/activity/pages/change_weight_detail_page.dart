import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/ui/main/activity/viewmodel/change_weight_viewmodel.dart';
import '../widgets/fat_tab.dart';
import '../widgets/muscle_mass_tab.dart';
import '../widgets/weight_tab.dart';

class ChangeWeightDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChangeWeightModel? model = ref.watch(ChangeWeightProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('내 변화', style: TextStyle(color: TColor.white)),
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
              WeightTab(model,"weight"),
              FatTab(model,"fat"),
              MuscleMassTab(model,"muscle"),
            ],
          ),
        ),
      );
    }
  }
}
