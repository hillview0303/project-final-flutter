import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/style.dart';
import '../pages/my_changes_page.dart';
import '../viewmodel/today_page_viewmodel.dart';
import 'input_modal.dart';

class TodayChangesDetail extends StatelessWidget {
  final WidgetRef ref;
  final TodayPageModel? model;

  TodayChangesDetail(this.ref, this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("체성분", style: subtitle1()),
        const Spacer(),
        InkWell(
          onTap: () => showInputModal(context, ref, model),
          child: Row(
            children: [
              Text(
                "직접 입력",
                style: subtitle2().copyWith(color: kAccentColor2),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.edit,
                size: 18,
                color: kAccentColor2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
