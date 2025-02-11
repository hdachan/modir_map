import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  runApp(MaterialApp(
    home: login_screen(),
  ));
}

class login_screen extends StatefulWidget {
  @override
  _login_screen createState() => _login_screen();
}

class _login_screen extends State<login_screen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); //디자인 사이즈기준
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 360.w,
                  height: 740.h,
                  padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 24.h,bottom: 24.h),
                  child: Column(
                    children: [
                      Container(
                        width: 328.w,
                        height: 359.h,
                        padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 24.h,bottom: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                          children: [
                            Container(
                              width: 296.w,
                              height: 63.h,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '모디랑',
                                      style: TextStyle(
                                        color: Color(0xFF05FFF7),
                                        fontSize: 24.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.30.h,
                                        letterSpacing: -0.60,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '에서 다양한\n매장 정보를 확인하세요',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.30.h,
                                        letterSpacing: -0.60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 266.w,
                              height: 40.h,
                              child: Text(
                                '실시간으로 업데이트 되는 매장 입고 브랜드와 함께\n팝업 스토어 정보까지 확인하세요',
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
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 328.w,
                        height: 272.h,
                        padding: EdgeInsets.only(top: 48.h,bottom: 48.h),
                        child: Column(
                          children: [
                            Container(
                              width: 328.w,
                              height: 48.h,
                              child: Image.asset(
                                'assets/image/goole_icon.png',
                                fit: BoxFit.fill, // 이미지를 Container에 꽉 채우기
                              ),
                            ),

                            SizedBox(height: 16.h),
                            Container(
                              width: 328.w,
                              height: 48.h,
                              child: Image.asset(
                                'assets/image/kakaoh_icon.png',
                                fit: BoxFit.fill, // 이미지를 Container에 꽉 채우기
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: 328.w,
                              height: 48.h,
                              child: Image.asset(
                                'assets/image/modir_logo_icon.png',
                                fit: BoxFit.fill, // 이미지를 Container에 꽉 채우기
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 328.w,
                        height: 20.h,
                        child: Text(
                          '아직 회원이 아니예요',
                          textAlign: TextAlign.center,
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
                      SizedBox(height: 8.h),
                      Container(
                        width: 328.w,
                        height: 17.h,
                        child: Text(
                          '회원가입',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40.h,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

