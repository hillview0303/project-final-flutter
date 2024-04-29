import 'package:flutter/material.dart';

import '../../../../../_core/constants/theme.dart';
import 'join_button_section.dart';
import 'join_birth_section.dart';
import 'join_divider_section.dart';
import 'join_gender_section.dart';
import 'join_height_section.dart';
import 'join_info_check_box_section.dart';
import 'join_name_section.dart';
import 'join_password_section.dart';
import 'join_phone_section.dart';
import 'join_sign_in_section.dart';
import 'join_username_section.dart';

class JoinContent extends StatelessWidget {
  const JoinContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 스크롤 추가
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 타이틀
            Text(
              '회원가입',
              style: textTheme().titleLarge,
            ),
            const SizedBox(height: 40.0),
            JoinNameSection(), // 이름
            const SizedBox(height: 25.0),
            JoinUsernameSection(), // ID
            const SizedBox(height: 25.0),
            JoinPasswordSection(), // 비밀번호
            const SizedBox(height: 25.0),
            JoinPhoneSection(), // 휴대폰
            const SizedBox(height: 25.0),
            JoinBirthSection(), // 생년월일 달력
            const SizedBox(height: 25.0),
            JoinGenderSection(), // 성별
            const SizedBox(height: 25.0),
            JoinHeightSection(), // 키
            const SizedBox(height: 25.0),
            JoinInfoCheckBoxSection(), // 개인정보처리방침
            const SizedBox(height: 25.0),
            JoinButtonSection(), // 회원가입버튼
            const SizedBox(height: 30.0),
            JoinDividerSection(), // 또는
            const SizedBox(height: 25.0),
            JoinSignInSection(), // 로그인 페이지가기
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
