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
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _confirmisPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _navigateToInformationScreen() {
    // 비밀번호와 비밀번호 확인 필드가 모두 입력되었는지 확인
    if (_passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      // 비밀번호가 비어 있을 경우
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('비밀번호를 입력해주세요')),
      );
    } else if (_passwordController.text != _confirmPasswordController.text) {
      // 비밀번호가 일치하지 않을 경우
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('비밀번호가 일치하지 않습니다')),
      );
    } else {
      // 비밀번호가 일치할 경우 InformationScreen으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InformationScreen(
            email: widget.email,
            password: _passwordController.text,
          ),
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
                CustomAppBar(title: '비밀번호 입력', context: context),
                Signuptext('비밀번호 입력', '계정 생성을 위해 비밀번호를 입력해주세요'),

                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16,right: 16),
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
                SizedBox(height: 8.h),
                Container(
                  width: 328.w,
                  height: 56.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
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
                SizedBox(height: 16.h),
                Container(
                  width: 360.w,
                  height: 152.h,
                  padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                  child: Container(
                    width: 328.w,
                    height: 136.h,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.08),
                        end: Alignment(-1, 0.08),
                        colors: [Color(0xFF242424), Color(0x4C242424)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 16),
                    child: Column(
                      children: [
                        Container(
                          width: 296.w,
                          height: 24.h,
                          child: Row(
                            children: [
                              Container(
                                width: 256.w,
                                height: 20.h,
                                child: Text(
                                  '영문, 숫자, 특수문자 조합하기',
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
                              SizedBox(width: 16.w),
                              Container(
                                width: 24.w,
                                height: 24.h,
                                child: Image.asset(
                                  'assets/image/Onbluecheck_icon.png',
                                  fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 296.w,
                          height: 24.h,
                          child: Row(
                            children: [
                              Container(
                                width: 256.w,
                                height: 20.h,
                                child: Text(
                                  '8자 이상 입력하기',
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
                              SizedBox(width: 16.w),
                              Container(
                                width: 24.w,
                                height: 24.h,
                                child: Image.asset(
                                  'assets/image/Onbluecheck_icon.png',
                                  fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 296.w,
                          height: 24.h,
                          child: Row(
                            children: [
                              Container(
                                width: 256.w,
                                height: 20.h,
                                child: Text(
                                  '연속된 문자 사용하지 않기',
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
                              SizedBox(width: 16.w),
                              Container(
                                width: 24.w,
                                height: 24.h,
                                child: Image.asset(
                                  'assets/image/Onbluecheck_icon.png',
                                  fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                    '비밀번호 확인을 위해 한번 더 입력해 주세요',
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
                SizedBox(height: 8.h),
                Container(
                  width: 328.w,
                  height: 56.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
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
                          controller: _confirmPasswordController,
                          obscureText: !_confirmisPasswordVisible,
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
                          _confirmisPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF888888),
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmisPasswordVisible = !_confirmisPasswordVisible;
                          });
                        },
                      ),
                    ],
                  ),
                ),

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
