import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../_core/constants/constants.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), //
          topRight: Radius.circular(20), //
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: kAccentColor2,
          onTap: onItemSelected,
          items: const [
            BottomNavigationBarItem(
                label: "오늘의나", icon: Icon(FontAwesomeIcons.house)),
            BottomNavigationBarItem(
                label: "나의활동", icon: Icon(FontAwesomeIcons.chartLine)),
            BottomNavigationBarItem(
                label: "챌린지", icon: Icon(FontAwesomeIcons.trophy)),
            BottomNavigationBarItem(
                label: "마이페이지", icon: Icon(FontAwesomeIcons.solidCircleUser)),
          ],
        ),
      ),
    );
  }
}
