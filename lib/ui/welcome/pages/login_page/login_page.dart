import 'package:flutter/material.dart';
import '../../../_common/components/custom_scaffold.dart';
import 'widgets/login_content.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: LoginContent(),
          ),
        ],
      ),
    );
  }
}
