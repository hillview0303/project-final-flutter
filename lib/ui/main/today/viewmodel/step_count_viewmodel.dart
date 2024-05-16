import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';
import '../../../../_core/constants/http.dart';
import '../../activity/viewmodel/walking_detail.viewmodel.dart';


class StepCountViewModel extends StateNotifier<int> {
  late StreamSubscription<StepCount> _stepCountStream;
  Timer? _timer;
  final  read;

  StepCountViewModel(this.read) : super(0) {
    initialize();
  }

  void initialize() {
    _loadSteps();
    _initializePedometer();
    _startTimer();
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

  @override
  void dispose() {
    _stepCountStream.cancel();
    _timer?.cancel();
    super.dispose();
  }
}

final StepCountProvider = StateNotifierProvider<StepCountViewModel, int>((ref) {
  return StepCountViewModel(ref.read);
});

