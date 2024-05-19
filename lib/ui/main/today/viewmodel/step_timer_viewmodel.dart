import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';
import '../../../../_core/constants/http.dart';
import '../../activity/viewmodel/walking_detail.viewmodel.dart';

class StepTimerState {
  final int currentSteps;
  final String calories;
  final String totalSteps;

  StepTimerState({required this.currentSteps, required this.calories, required this.totalSteps});
}

class StepTimerViewModel extends StateNotifier<StepTimerState> {
  late StreamSubscription<StepCount> _stepCountStream;
  Timer? _timer;
  int secondCount = 0;
  Timer? _midnightTimer;  // 자정 타이머
  final read;

  StepTimerViewModel(this.read)
      : super(StepTimerState(currentSteps: 0, calories: '0 kcal', totalSteps: '0')) {
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
    _updateState(event.steps);
    _saveSteps(event.steps);
  }

  void _onStepCountError(dynamic error) {
    print("Step Count Error: $error");
  }

  void _saveSteps(int steps) async {
    await secureStorage.write(key: 'current_steps', value: steps.toString());
  }

  Future<void> _loadSteps() async {
    String? storedSteps = await secureStorage.read(key: 'current_steps');
    int steps = int.tryParse(storedSteps ?? '0') ?? 0;
    _updateState(steps);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _updateState(state.currentSteps + 1);
      _saveSteps(state.currentSteps);

      secondCount++;

      if (secondCount % 10 == 0) {
        _sendCurrentStepsToServer();
      }
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
    _midnightTimer = Timer(_timeUntilMidnight(), () async {
      state = StepTimerState(currentSteps: 0, calories: '0 kcal', totalSteps: '0');
      await secureStorage.delete(key: 'current_steps');
      _resetStepsAtMidnight();
    });
  }

  void _updateState(int steps) {
    state = StepTimerState(
      currentSteps: steps,
      calories: (steps * 0.04).toStringAsFixed(0) + ' kcal', // 칼로리 계산 임의로 함
      totalSteps: steps.toString(),
    );
  }

  @override
  void dispose() {
    _stepCountStream.cancel();
    _timer?.cancel();
    _midnightTimer?.cancel();  // 자정 타이머 해제
    super.dispose();
  }
}

// Provider 정의
final StepTimerProvider = StateNotifierProvider<StepTimerViewModel, StepTimerState>((ref) {
  return StepTimerViewModel(ref.read);
});
