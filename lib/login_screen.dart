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
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // 빈 칸 검사
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일과 비밀번호를 모두 입력해주세요.')),
      );
      return;
    }

    // 이메일 형식 검사 (간단한 정규식)
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('유효한 이메일 주소를 입력해주세요.')),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // 로그인 성공 시
      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('로그인 성공!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home_screen()),
        );
      } else {
        // user가 null인 경우 (이론상 도달하기 어려움)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('로그인 실패: 사용자 정보를 확인할 수 없습니다.')),
        );
      }
    } on AuthException catch (error) {
      // AuthException을 통해 오류 코드 및 메시지를 처리
      String errorMessage;
      switch (error.statusCode) {
        case 403:
          errorMessage = '접근이 금지되었습니다. 해당 기능을 사용할 수 없습니다.';
          break;
        case 422:
          errorMessage = '요청을 처리할 수 없습니다. 입력값을 확인해주세요.';
          break;
        case 429:
          errorMessage = '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.';
          break;
        case 500:
          errorMessage = '내부 서버 오류가 발생했습니다. 고객센터로 문의하세요.';
          break;
        case 501:
          errorMessage = '요청한 기능이 구현되지 않았습니다.';
          break;
        default:
          errorMessage = error.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (error) {
      // 그 외의 예외 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패: $error')),
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
                            hintText: '이메일',
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
                        Container(
                          width: 24.w,
                          height: 24.h,
                          alignment: Alignment.center, // 중앙 정렬
                          child: IconButton(
                            padding: EdgeInsets.zero, // 패딩 제거
                            icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                            onPressed: () {
                              _emailController.clear();
                              setState(() {
                                _isTextFieldEmpty = true; // 상태 업데이트
                              });
                            },
                          ),
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
                      Container(
                        width: 24.w,
                        height: 24.h,
                        alignment: Alignment.center, // 중앙 정렬
                        child: IconButton(
                          padding: EdgeInsets.zero, // 패딩 제거
                          //constraints: BoxConstraints(), // 기본 제약 조건 제거
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF888888),
                          ),
                          iconSize: 24.sp, // 아이콘 크기를 24로 설정
                          onPressed: _togglePasswordVisibility, // 비밀번호 표시 토글
                        ),
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
                          color: isChecked ? Color(0xFF888888) : Colors.grey,
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
      bottomNavigationBar: LoginButton(
        buttonText: '로그인', // 로그인 텍스트 전달
        onTap: () {
          // 로그인 버튼 클릭 시 실행할 코드
          _signIn();
        },
      ),
    );
  }
}
