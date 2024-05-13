import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/main.dart';

class SurveyListModel {}

class SurveyListViewModel extends StateNotifier<SurveyListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SurveyListViewModel(super._state, this.ref);
}

final surveyListProvider =
    StateNotifierProvider<SurveyListViewModel, SurveyListModel?>(
  (ref) {
    return SurveyListViewModel(null, ref);
  },
);
