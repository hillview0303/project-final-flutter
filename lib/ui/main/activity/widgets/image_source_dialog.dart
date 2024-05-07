import 'package:flutter/material.dart';

typedef ImageSourceCallback = void Function(bool useCamera);

class ImageSourceDialog extends StatelessWidget {
  final ImageSourceCallback onImageSourceSelected;
  final Color accentColor;

  ImageSourceDialog({required this.onImageSourceSelected, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: accentColor,
          onPrimary: Colors.white,
          onSurface: Colors.black,
        ),
        dialogBackgroundColor: Colors.white,
      ),
      child: AlertDialog(
        title: Text('이미지 선택'),
        content: Text('어디에서 이미지를 선택하시겠습니까?'),
        actions: <Widget>[
          TextButton(
            child: Text('카메라'),
            onPressed: () {
              Navigator.of(context).pop();
              onImageSourceSelected(true); // 카메라 선택
            },
          ),
          TextButton(
            child: Text('갤러리'),
            onPressed: () {
              Navigator.of(context).pop();
              onImageSourceSelected(false); // 갤러리 선택
            },
          ),
        ],
      ),
    );
  }
}
