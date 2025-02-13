import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'information_screen.dart';
import 'screen_setting.dart'; // 정보 입력 화면 import

class PasswordScreen extends StatefulWidget {
  final String email;

  PasswordScreen({required this.email});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToInformationScreen() {
    if (_passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InformationScreen(
            email: widget.email,
            password: _passwordController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('비밀번호를 입력해주세요')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); // 디자인 사이즈 기준
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomAppBar(title: '비밀번호 입력', context: context),
                Signuptext('비밀번호 입력', '계정 생성을 위해 비밀번호를 입력해주세요'),
                SizedBox(height: 8.h),
                Container(
                  width: 360.w,
                  height: 80.h,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: Container(
                    width: 328.w,
                    height: 56.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Color(0xFF242424),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '비밀번호 입력',
                              hintStyle: TextStyle(color: Color(0xFF888888)),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Color(0xFF888888),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:LoginButton(
        buttonText: '정보입력', // 로그인 텍스트 전달
        onTap:  () => _navigateToInformationScreen(),
      ),
    );
  }
}
