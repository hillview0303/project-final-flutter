import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/ui/main/my/viewmodel/profile_edit_view_model.dart';

import '../../../../data/dtos/my/my_response.dart';

class EditProfileForm extends ConsumerWidget {
  final ProfileUpdateFormDTO reqDTO;

  EditProfileForm(this.reqDTO);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileEditViewModel? profileEditViewModel =
        ref.read(profileEditProvider.notifier);

    final _nameController = TextEditingController(text: reqDTO.name);
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _phoneController = TextEditingController(text: reqDTO.phone);
    final _heightController = TextEditingController(text: "${reqDTO.height}");

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text('이름'),
                hintText: '이름을 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('비밀번호'),
                hintText: '비밀번호를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('비밀번호 확인'),
                hintText: '비밀번호를 다시 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                label: Text('휴대폰번호'),
                hintText: '휴대폰번호를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                label: Text('키'),
                hintText: '키를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              // Set the button width to full width of the container
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_passwordController.text.trim() ==
                        _confirmPasswordController.text.trim()) {
                      UserUpdateDTO updateDTO = UserUpdateDTO(
                          id: reqDTO.id,
                          name: _nameController.text.trim(),
                          phone: _phoneController.text.trim(),
                          height: double.parse(_heightController.text.trim()));
                      profileEditViewModel!.updateProfile(updateDTO);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("비밀번호가 다릅니다.")));
                    }
                  }
                },
                child: Text('저장'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor2,
                  foregroundColor: TColor.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
