import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

import '../../../../../_core/constants/style.dart';

class ActivityHeader extends StatefulWidget {
  const ActivityHeader({super.key});

  @override
  State<ActivityHeader> createState() => _ActivityHeaderState();
}

class _ActivityHeaderState extends State<ActivityHeader> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
  CalendarAgendaController();

  late DateTime _selectedDateAppBBar;

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            '나의 활동',
            style: h6(mColor: Colors.grey),
          ),
        ),
        CalendarAgenda(
          controller: _calendarAgendaControllerAppBar,
          appbar: false,
          selectedDayPosition: SelectedDayPosition.center,
          leading: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/arrowleft.png",
                width: 15,
                height: 15,
              ),),

          training: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/arrowright.png",
                width: 15,
                height: 15,
              )),
          weekDay: WeekDay.short,
          dayNameFontSize: 14,
          dayNumberFontSize: 18,
          dayBGColor: Colors.grey.withOpacity(0.15),
          titleSpaceBetween: 15,
          backgroundColor: Colors.transparent,
          // fullCalendar: false,
          fullCalendarScroll: FullCalendarScroll.horizontal,
          fullCalendarDay: WeekDay.short,
          selectedDateColor: Colors.white,
          dateColor: Colors.black,
          locale: 'ko',

          initialDate: DateTime.now(),
          calendarEventColor: TColor.primaryColor2,
          firstDate: DateTime.now().subtract(const Duration(days: 140)),
          lastDate: DateTime.now().add(const Duration(days: 60)),

          onDateSelected: (date) {
            _selectedDateAppBBar = date;
          },
          selectedDayLogo: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
