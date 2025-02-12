import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/screen_setting.dart';

import 'main.dart';


class login_screen extends StatefulWidget {
  @override
  _login_screen createState() => _login_screen();
}

class _login_screen extends State<login_screen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isTextFieldEmpty = true;
  @override
  void initState() {
    super.initState();
    // 텍스트 변경 리스너 추가
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

  Future<void> _signIn() async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('로그인 성공!')),
        );

        // 로그인 성공 후 다른 화면으로 이동 가능
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home_screen()), // HomePage는 로그인 후 이동할 화면
        );
      }
    } catch (e) {
      print('로그인 오류: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패: $e')),
      );
    }
  }

  bool isChecked = false; // 체크 상태를 저장하는 변수

  bool _obscureText = true; // 비밀번호 숨김 상태

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // 비밀번호 숨김 상태 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); //디자인 사이즈기준
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드가 올라오면 화면이 조정됨
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              CustomloginAppBar(title: '로그인', context: context),
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
                      // X 아이콘
                      if (!_isTextFieldEmpty)
                        IconButton(
                          icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                          onPressed: () {
                            _emailController.clear();
                            setState(() {
                              _isTextFieldEmpty = true; // 상태 업데이트
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40.h,
                            letterSpacing: -0.35,
                          ),
                          obscureText: _obscureText, // 비밀번호 숨김 상태 적용
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
                      IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF888888),
                        ),
                        onPressed: _togglePasswordVisibility, // 비밀번호 표시 토글
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),
              Container(
                width: 360.w,
                height: 24.h,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked; // 체크 상태를 토글
                        });
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        child: Icon(
                          isChecked
                              ? Icons.check
                              : Icons
                                  .check_box_outline_blank, // 체크 상태에 따라 아이콘 변경
                          color: isChecked ?         Color(0xFF888888) : Colors.grey,
                          // 체크 상태에 따라 색상 변경
                          size: 24.sp, // 아이콘 크기
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 131.w,
                      height: 20.h,
                      child: Text(
                        '자동 로그인',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.40.h,
                          letterSpacing: -0.35,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 70.w,
                      height: 20.h,
                      child: Text(
                        '아이디 찾기',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.40.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 77.w,
                      height: 20.h,
                      child: Text(
                        '비밀번호 찾기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.40.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: 100.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
          child: InkWell(
            onTap: () {
              _signIn();
            },
            child: Container(
              width: 328.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: Color(0xFF05FFF7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              child: Text(
                '로그인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 20.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.40.h,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
