import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SettingState.dart';
import 'screen_setting.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase import

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

  Future<void> _signUp() async {
    try {
      // 회원가입 요청
      final response = await supabase.auth.signUp(
        email: widget.email, // 이메일은 widget.email로 접근
        password: _passwordController.text,
      );

      if (response.session != null) {
        // 회원가입 성공 시 추가 정보 저장
        final user = response.user;
        if (user != null) {
          // profiles 테이블에 이메일과 비밀번호 저장
          await supabase.from('profiles').upsert({
            'email': widget.email,
            'password': _passwordController.text, // 비밀번호는 일반적으로 저장하지 않지만, 필요하다면 이렇게 저장
          });

          // 회원가입 성공 후 홈 화면으로 이동
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _createAccount() {
    if (_passwordController.text.isNotEmpty) {
      _signUp(); // _signUp 메서드 호출
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('비밀번호를 입력해주세요.')),
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
                Container(
                  width: 360.w,
                  height: 148.h,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 48),
                  child: Column(
                    children: [
                      Container(
                        width: 328.w,
                        height: 28.h,
                        child: Text(
                          '비밀번호 입력',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40.h,
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 328.w,
                        height: 16.h,
                        child: Text(
                          '계정 생성을 위해 비밀번호를 입력해주세요',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.30.h,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '비밀번호를 입력해주세요',
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
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
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
                              hintText: '비밀번호 입력',
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
                ElevatedButton(
                  onPressed: _createAccount,
                  child: Text('계정 생성'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}