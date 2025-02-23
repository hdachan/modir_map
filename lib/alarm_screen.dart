import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'information_screen.dart';
import 'screen_setting.dart'; // 정보 입력 화면 import

class alam_screen extends StatefulWidget {
  @override
  _alam_screenState createState() => _alam_screenState();
}

class _alam_screenState extends State<alam_screen> {
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
                buildHeaderBarIcon(
                  context,
                  titleText: '알림',
                  rightIcon: Icons.more_vert_outlined, // 오른쪽 아이콘 변경
                  onRightTap: () {
                    print("오른쪽 아이콘 눌림 - 메뉴 열기");
                  },
                ),
                Container(
                  width: 360.w,
                  height: 68.h,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '공지',
                            style: TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 14.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.40.h,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                          child:         Text(
                            '매장',
                            textAlign: TextAlign.center,
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
