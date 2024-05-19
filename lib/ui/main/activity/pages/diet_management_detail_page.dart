import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/ui/main/activity/viewmodel/diet_management_detail_viewmodel.dart';
import 'package:project_app/ui/main/activity/widgets/today_nutrition_info.dart';

import '../../../../_core/constants/size.dart';
import '../widgets/custom_calendar_Agenda.dart';
import '../widgets/food_card.dart';

class DietManagementDetailPage extends ConsumerWidget {
  final CalendarAgendaController _controller = CalendarAgendaController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DietManageMentDetailModel? model = ref.watch(dietManagementDetailProvider);
    DietManagementDetailViewModel? viewModel =
        ref.read(dietManagementDetailProvider.notifier);

    // 목표 값 설정
    final double targetCalories = 2000;
    final double targetCarbo = 300;
    final double targetProtein = 150;
    final double targetFat = 70;

    // 고정된 식사 카드
    final List<String> mealTypes = ['아침', '점심', '저녁', '간식'];

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('식단 관리', style: TextStyle(color: Colors.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: kAccentColor2,
        body: Column(
          children: <Widget>[
            CustomCalendarAgenda(
              controller: _controller,
              initialDate: model!.selectedDateTime!,
              onDateSelected: (date) {
                viewModel!.notifyInit(date);
              },
            ),
            SizedBox(height: gap_m),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: TColor.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 30),
                    itemCount: mealTypes.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return TodayNutritionInfo(
                          totalCalories: model.totalCalories ?? 0,
                          totalCarbo: model.totalCarbo ?? 0,
                          totalProtein: model.totalProtein ?? 0,
                          totalFat: model.totalFat ?? 0,
                          targetCalories: targetCalories,
                          targetCarbo: targetCarbo,
                          targetProtein: targetProtein,
                          targetFat: targetFat,
                        );
                      } else {
                        final mealType = mealTypes[index - 1];
                        final mealId = index >
                                model.mealMainDTO!.mealList!.length
                            ? null
                            : model.mealMainDTO!.mealList![index - 1].mealId;
                        final meals = model.mealMainDTO!.mealList!
                            .where((meal) => meal.eatTime == mealType)
                            .expand((meal) => meal.foods!)
                            .toList();
                        return foodCard(
                          mealId,
                          context,
                          mealType,
                          meals,
                          // todo : 이미지 디바이스에 저장 구현 후 수정 필요
                          // meals.isNotEmpty && meals[0].imagePath.isNotEmpty
                          //     ? meals[0].imagePath :
                          'assets/images/1.png',
                          model.selectedDateTime ?? DateTime.now(),
                          ref,
                          Colors.deepOrange[200]!,
                          Colors.cyanAccent,
                          Colors.greenAccent,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
