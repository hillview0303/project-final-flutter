import 'package:flutter/material.dart';

import '../../../../../_core/constants/theme.dart';


class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '로그인',
      style: textTheme().titleLarge,
    );
  }
}
