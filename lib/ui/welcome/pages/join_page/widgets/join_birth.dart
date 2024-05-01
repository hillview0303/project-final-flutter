import 'package:flutter/material.dart';

class JoinBirth extends StatefulWidget {
  const JoinBirth({Key? key}) : super(key: key);

  @override
  State<JoinBirth> createState() => _JoinBirthState();
}

class _JoinBirthState extends State<JoinBirth> {
  DateTime? selectedDate; // 날짜

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.teal, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.black, // body text color
                ),
                dialogBackgroundColor: Colors.white, // background color of the dialog
              ),
              child: child!,
            );
          },
        );
        if (picked != null && picked != selectedDate) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? '생년월일을 입력하세요'
                  : '${selectedDate!.toLocal()}'.split(' ')[0],
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
            const Icon(Icons.calendar_today, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
