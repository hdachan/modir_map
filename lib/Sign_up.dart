import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  Future<void> _navigateToPasswordScreen(BuildContext context) async {
    final email = _emailController.text.trim();

    // 이메일 빈 칸 검사
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일 주소를 입력하세요.')),
      );
      return;
    }

    // 이메일 형식 검사
    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('유효한 이메일 주소를 입력하세요.')),
      );
      return;
    }

    try {
      // 새로운 Supabase 버전에서는 maybeSingle()이 null 또는 Map<String, dynamic>를 반환합니다.
      final response = await Supabase.instance.client
          .from('userinfo')
          .select('id')
          .eq('email', email)
          .maybeSingle();

      // 이미 등록된 이메일인 경우 response가 null이 아니게 됩니다.
      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미 등록된 이메일입니다.')),
        );
        return;
      }

      // 해당 이메일이 등록되어 있지 않으면 PasswordScreen으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordScreen(email: email),
        ),
      );
    } catch (error) {
      // 오류가 발생하면 예외가 throw되므로 catch로 처리합니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류가 발생했습니다. 잠시 후 다시 시도해주세요.')),
      );
    }
  }

// 이메일 유효성 검사 함수
  bool _isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
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
                              hintText: 'email@address.com',
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


