import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This would be the top bar of the activity page, perhaps a summary or title
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        '일일 통계',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
