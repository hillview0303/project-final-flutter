import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/pages/step_count_detail_page.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';
import 'package:project_app/ui/main/today/widgets/today_body.dart';
import 'package:project_app/ui/main/today/widgets/today_header.dart';

import '../../../_core/constants/http.dart';
import '../activity/viewmodel/walking_detail.viewmodel.dart';
import 'viewmodel/visibility_state_viewmodel.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibilityState = ref.watch(visibilityProvider);
    TodayPageModel? model = ref.watch(TodayPageProvider);

    return FutureBuilder<int>(
      future: _sendStepsToServer(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
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
      },
    );
  }

  Future<int> _sendStepsToServer(WidgetRef ref) async {
    String? stepsString = await secureStorage.read(key: 'current_steps');
    int steps = int.tryParse(stepsString ?? '0') ?? 0;
    ref.read(WalkingDetailProvider.notifier).sendStepsToServer(steps);
    StepCountDetailPage();
    return steps;
  }
}
