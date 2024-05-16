import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/today/viewmodel/step_count_viewmodel.dart';
import 'package:project_app/ui/main/today/viewmodel/step_timer_viewmodel.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';
import 'package:project_app/ui/main/today/widgets/today_body.dart';
import 'package:project_app/ui/main/today/widgets/today_header.dart';
import 'viewmodel/visibility_state_viewmodel.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibilityState = ref.watch(visibilityProvider);
    TodayPageModel? model = ref.watch(TodayPageProvider);
    //todo : 1초당 1씩 올라가는 vm
    // ref.watch(StepTimerProvider);
    //todo : 만보기 vm
    ref.watch(StepCountProvider);


    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            TodayHeader(visibilityState, model),
            TodayBody(),
          ],
        ),
      );
    }
  }
}
