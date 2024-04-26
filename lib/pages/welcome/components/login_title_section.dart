import 'package:flutter/material.dart';

import '../../../common/design/theme.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '로그인',
      style: textTheme().titleLarge,
    );
  }
}
