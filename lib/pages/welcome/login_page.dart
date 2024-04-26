import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/join_page.dart';
import 'package:project_app/common/design/theme.dart';
import '../main_page.dart';
import 'components/custom_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 제목
                      Text(
                        '로그인',
                        style: textTheme().titleLarge,
                      ),
                      const SizedBox(height: 40.0),
                      // ID 입력
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text('ID'),
                          hintText: 'ID를 입력하세요',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // PW 입력
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: '비밀번호를 입력하세요',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        // 로그인 정보 기억하기
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Checkbox(
                                value: false,
                                onChanged: null,
                              ),
                              const Text(
                                '기억하기',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                          // 비번찾기
                          const Text(
                            '비밀번호 찾기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        // 로그인 버튼
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // 로그인 기능 구현 전 임시로 버튼을 누르면 메인페이지로 이동하게 함
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const MainPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Log in'),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('또는',
                                style: TextStyle(color: Colors.black45)),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JoinPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('계정이 없으신가요? ',
                                style: TextStyle(color: Colors.black45)),
                            Text('회원가입하기',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
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
