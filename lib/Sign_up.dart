import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'information_screen.dart';
import 'screen_setting.dart';
import 'password_screen.dart'; // 다음 화면 import

class SignUp_screen extends StatefulWidget {
  @override
  _SignUp_screen createState() => _SignUp_screen();
}

class _SignUp_screen extends State<SignUp_screen> with SingleTickerProviderStateMixin {
  bool _isTextFieldEmpty = true;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _emailController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _navigateToPasswordScreen(BuildContext context) {
    if (_emailController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordScreen(email: _emailController.text),
        ),
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
                CustomAppBar(title: '모디랑 회원가입', context: context),
                Signuptext('이메일 입력', '로그인에 사용할 이메일을 입력해주세요'),
                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '이메일을 입력해주세요',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.40.h,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ),
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
                            controller: _emailController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.40.h,
                              letterSpacing: -0.35,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '여기에 입력하세요',
                              hintStyle: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.40.h,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        if (!_isTextFieldEmpty)
                          IconButton(
                            icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                            onPressed: () {
                              _emailController.clear();
                              setState(() {
                                _isTextFieldEmpty = true;
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
        buttonText: '다음1', // 로그인 텍스트 전달
        onTap:  () => _navigateToPasswordScreen(context),
      ),
    );
  }
}


