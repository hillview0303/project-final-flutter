import 'calendar.dart';

class CalendarAgendaController {
  CalendarAgendaState? state;

  void bindState(CalendarAgendaState state) {
    this.state = state;
  }

  // 이전 달로 이동
  void previousMonth() {
    if (state != null && state!.selectedDate != null) {
      DateTime newDate = DateTime(state!.selectedDate!.year, state!.selectedDate!.month - 1);
      state!.getDate(newDate);
    }
  }

  // 다음 달로 이동
  void nextMonth() {
    if (state != null && state!.selectedDate != null) {
      DateTime newDate = DateTime(state!.selectedDate!.year, state!.selectedDate!.month + 1);
      state!.getDate(newDate);
    }
  }


  void goToDay(DateTime date) {
    state!.getDate(date);
  }

  void dispose() {
    state = null;
  }
}
