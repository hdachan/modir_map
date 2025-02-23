import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'information_screen.dart';
import 'screen_setting.dart'; // 정보 입력 화면 import

class StoresLike extends StatefulWidget {
  @override
  _StoresLikeState createState() => _StoresLikeState();
}

class _StoresLikeState extends State<StoresLike> {

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
                buildHeaderBar(
                  context,
                  filterText: '관심매장', // 원하는 필터 텍스트
                  resetText: '편집', // 원하는 초기화 텍스트
                ),
                Container(
                  width: 360.w,
                  height: 56.h,
                  //color: Colors.cyan,
                  padding: EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 32.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                        child:         Text(
                          '전체 (0)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
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
                  height: 628.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//Frame%204060.svg"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
