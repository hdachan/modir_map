import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MaterialApp(
    home: Setting_test(), // Setting 위젯을 홈으로 설정
  ));
}

class Setting_test extends StatefulWidget {
  @override
  _SettingStatetest createState() => _SettingStatetest();
}

class _SettingStatetest extends State<Setting_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea 추가
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // 검색
                Container(
                  width: 360.w,
                  height: 80.h,
                  padding: EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
                  decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // 현재 화면을 닫고 이전 화면으로 돌아감
                            },
                            child: Container(
                              width: 56.w,
                              height: 56.h,
                              padding: EdgeInsets.all(16.w), // 패딩을 ScreenUtil로 설정
                              child: Icon(
                                Icons.chevron_left, // 다른 뒤로가기 화살표 아이콘
                                size: 24.sp, // 아이콘 크기를 ScreenUtil로 설정
                                color: Colors.white, // 아이콘 색상은 필요에 따라 변경 가능
                              ),
                            ),
                          ),
                          Container(
                            width: 288.w,
                            height: 48.h,
                            padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 12.h, bottom: 12.h),
                            decoration: ShapeDecoration(
                              color: Color(0x19320E99),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Color(0xFF4D17EE)),
                                borderRadius: BorderRadius.circular(16.w), // 반지름을 ScreenUtil로 설정
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none, // 기본 테두리 제거
                                contentPadding: EdgeInsets.only(top: 12, right: 16, bottom: 12), // 패딩 설정
                                hintText: '스타일, 브랜드, 매장, 위치 검색', // 힌트 텍스트
                                hintStyle: TextStyle(
                                  color: Color(0xFF888888), // 힌트 텍스트 색상
                                ),
                              ),
                              style: TextStyle(
                                color: Color(0xFF888888), // 입력 텍스트 색상
                                fontSize: 14, // 폰트 크기를 ScreenUtil로 설정
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.70,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
