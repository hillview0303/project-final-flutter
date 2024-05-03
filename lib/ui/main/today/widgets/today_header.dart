import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/today_bodydata.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_detail.dart';
import 'package:project_app/ui/main/today/widgets/today_target.dart';
import 'package:project_app/ui/main/today/widgets/today_user_data.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../data/models/chartDummy.dart';

class TodayHeader extends StatefulWidget {
  const TodayHeader({super.key});

  @override
  _TodayHeaderState createState() => _TodayHeaderState();
}

class _TodayHeaderState extends State<TodayHeader> {
  bool fatVisible = true;
  bool muscleVisible = true;
  bool weightVisible = true;

  void toggleVisibility(String type) {
    setState(() {
      if (type == 'fat') fatVisible = !fatVisible;
      if (type == 'muscle') muscleVisible = !muscleVisible;
      if (type == 'weight') weightVisible = !weightVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayUserData(),
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            children: [
              TodayChangesDetail(),
              SizedBox(height: gap_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: gap_l),
                child: TodayChangesChart(
                  fatData: fatVisible ? fatData : [],
                  muscleData: muscleVisible ? muscleData : [],
                  weightData: weightVisible ? weightData : [],
                ),
              ),
              SizedBox(height: gap_m),
              TodayBodydata(
                toggleVisibility: toggleVisibility,
                fatVisible: fatVisible,
                muscleVisible: muscleVisible,
                weightVisible: weightVisible,
              ),
              SizedBox(height: gap_l),
              TodayTarget(),
            ],
          ),
        ),
      ],
    );
  }
}
