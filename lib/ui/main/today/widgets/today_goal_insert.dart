import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';
import '../../../../../_core/constants/move.dart';
import '../../../../data/dtos/today/today_request.dart';

class TodayGoalInsert extends ConsumerWidget {
  final name;
  TodayPageModel model;

  TodayGoalInsert(this.name,this.model);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final _bodydata = TextEditingController();

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kAccentColor2,
            ),
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: _bodydata,
              decoration: InputDecoration(
                  labelText: '목표량',
                  labelStyle: TextStyle(fontSize: 15, color: TColor.darkGrey),
                  hintText: '목표량을 입력하세요',
                  hintStyle: TextStyle(color: TColor.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: kAccentColor2))),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () async {
                double? formatData = double.tryParse(_bodydata.text) ;
                if(name=="체지방"){
                  await ref.watch(TodayPageProvider.notifier).notifyAddFat(AddGoalFatRequestDTO(formatData));
                }else if(name=="골격근"){
                  await ref.watch(TodayPageProvider.notifier).notifyAddMuscle(AddGoalMuscleRequestDTO(formatData));
                }else if(name=="체중"){
                  await  ref.watch(TodayPageProvider.notifier).notifyAddWeight(AddGoalWeightRequestDTO(formatData));
                }
                ref.watch(TodayPageProvider.notifier).notifyInit();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor2,
                foregroundColor: Colors.white,
                elevation: 10,
              ),
              child: const Text(
                '입력 완료',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
