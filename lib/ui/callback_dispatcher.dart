import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/pages/step_count_detail_page.dart';
import 'package:workmanager/workmanager.dart';

import '../_core/constants/http.dart';
import 'main/activity/viewmodel/walking_detail.viewmodel.dart';

const fetchBackground = "fetchBackground";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
      // 걸음 수를 서버에 전송하는 로직
        String? stepsString = await secureStorage.read(key: 'current_steps');
        int steps = int.tryParse(stepsString ?? '0') ?? 0;
        final container = ProviderContainer();
        await container.read(WalkingDetailProvider.notifier).sendStepsToServer(steps);
        break;
    }
    return Future.value(true);
  });
}

