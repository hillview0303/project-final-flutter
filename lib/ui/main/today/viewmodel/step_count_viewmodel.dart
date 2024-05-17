import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';
import '../../../../_core/constants/http.dart';
import '../../activity/viewmodel/walking_detail.viewmodel.dart';

class StepCountViewModel extends StateNotifier<int> {
  late StreamSubscription<StepCount> _stepCountStream;
  Timer? _timer;
  Timer? _midnightTimer;
  final read;

  StepCountViewModel(this.read) : super(0) {
    initialize();
  }

  void initialize() {
    _loadSteps();
    _initializePedometer();
    _startTimer();
    _resetStepsAtMidnight(); // 자정에 리셋 타이머 시작
  }

  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountError,
    );
  }

  void _onStepCount(StepCount event) {
    state = event.steps;
    _saveSteps(state);
  }

  void _onStepCountError(dynamic error) {
    print("Step Count Error: $error");
  }

  void _saveSteps(int steps) async {
    await secureStorage.write(key: 'current_steps', value: steps.toString());
  }

  Future<void> _loadSteps() async {
    String? storedSteps = await secureStorage.read(key: 'current_steps');
    state = int.tryParse(storedSteps ?? '0') ?? 0;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      _sendCurrentStepsToServer();
    });
  }

  void _sendCurrentStepsToServer() async {
    String? stepsString = await secureStorage.read(key: 'current_steps');
    int steps = int.tryParse(stepsString ?? '0') ?? 0;
    read(WalkingDetailProvider.notifier).sendStepsToServer(steps);
  }

  Duration _timeUntilMidnight() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return tomorrow.difference(now);
  }

  void _resetStepsAtMidnight() {
    _midnightTimer = Timer(_timeUntilMidnight(), () {
      state = 0;
      _saveSteps(0);
      _resetStepsAtMidnight(); // 다음 자정을 위한 타이머 재설정
    });
  }

  @override
  void dispose() {
    _stepCountStream.cancel();
    _timer?.cancel();
    _midnightTimer?.cancel();
    super.dispose();
  }
}

final StepCountProvider = StateNotifierProvider<StepCountViewModel, int>((ref) {
  return StepCountViewModel(ref.read);
});
