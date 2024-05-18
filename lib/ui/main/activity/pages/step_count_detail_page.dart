import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/today/viewmodel/step_count_viewmodel.dart';
import '../../../../_core/constants/constants.dart';
import '../../today/viewmodel/step_timer_viewmodel.dart';
import '../widgets/step_count_body.dart';

class StepCountDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todo : 1초에 1씩 올라가는 vm
    final stepTimerState = ref.watch(StepTimerProvider);
    final int currentSteps = stepTimerState.currentSteps;
    final String calories = stepTimerState.calories;
    final String totalSteps = stepTimerState.totalSteps;
// 만보기를 쓰려면 stepcountviewmodel에서 가져와야함

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('걸음 수', style: TextStyle(color: Colors.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Day'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: StepCountBody(
          currentSteps: currentSteps,
          calories: calories,
          totalSteps: totalSteps,
        ),
      ),
    );
  }
}
