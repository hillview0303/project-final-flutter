import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key, this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText; // 버튼 안 글자
  final Widget? onTap; // 버튼 클릭시 이동
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push( // 버튼클릭하면 다른페이지로 이동함
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 100, minHeight: 50), // 최소 크기 설정
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // 패딩 조정
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: FittedBox( // 텍스트가 버튼 크기를 벗어나지 않도록
          child: Text(
            buttonText!, // String은 null이 될 수 있으므로 null 방지
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: textColor!,
            ),
          ),
        ),
      ),
    );
  }
}
