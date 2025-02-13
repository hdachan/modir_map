import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/search_screen.dart';

import 'donut_chart_painter.dart';
import 'screen_setting.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int selectedIndex = 0; // 현재 선택된 컨테이너 인덱스

  Widget getSelectedContainer() {
    switch (selectedIndex) {
      case 0:
        return Container(
          width: 236.w,
          height: 360.h,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: ShapeDecoration(
            color: Color(0xFF242424),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8), // 모서리 둥글게
            child: SvgPicture.asset(
              "assets/image/advertisement_1.svg", // SVG 이미지 경로
              fit: BoxFit.fill, // 이미지 크기 조정
            ),
          ),
        );

      case 1:
        return Container(
          width: 236.w,
          height: 360.h,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: ShapeDecoration(
            color: Color(0xFF242424),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 236.w,
                height: 328.h,
                padding:
                    EdgeInsets.only(top: 24, bottom: 24, right: 16, left: 16),
                child: Column(
                  children: [
                    Container(
                      width: 204.w,
                      height: 56.h,
                      child: Text(
                        '58% 패션인들의 선택\n왜 스트릿일까 ?',
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
                    SizedBox(height: 24.h),
                    Container(
                      width: 204.w,
                      height: 204.h,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: DonutChart(
                        size: 204, // 원하는 도넛 크기 지정
                        strokeWidth: 20,
                        total: 100,
                        value: 58,
                        child: Text(
                          '58%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF05FFF7),
                            fontSize: 24.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40.h,
                            letterSpacing: -0.60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      case 2:
        return Container(
          width: 236.w,
          height: 360.h,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: ShapeDecoration(
            color: Color(0xFF242424),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8), // 모서리 둥글게
            child: SvgPicture.asset(
              "assets/image/advertisement_3.svg", // SVG 이미지 경로
              fit: BoxFit.fill, // 이미지 크기 조정
            ),
          ),
        );

      default:
        return Container(); // 기본값
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //상단 바
              buildAppBar(),

              //검색
              customSearchButton(context, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => search_screen()),
                );
              }),

              //광고바
              Container(
                width: 360.w,
                height: 460.h,
                padding: EdgeInsets.only(top: 24, bottom: 24),
                child: Column(
                  children: [
                    Container(
                      width: 360.w,
                      height: 360.h,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          getSelectedContainer(),
                          SizedBox(width: 8.w),
                          SingleChildScrollView(

                            child: Column(
                              children: List.generate(4, (index) {
                                // index별로 다른 이미지 경로 설정
                                List<String> imagePaths = [
                                  "assets/image/advertisement_1.svg",
                                  "assets/image/advertisement_2.svg",
                                  "assets/image/advertisement_3.svg",
                                  "assets/image/advertisement_4.svg"
                                ];

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: 84.w,
                                    height: 106.h,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.w,
                                          color: selectedIndex == index
                                              ? Color(0xFF05FFF7) // 선택된 경우 다른 색상
                                              : Color(0xFF1A1A1A),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.w),
                                      child: SvgPicture.asset(
                                        imagePaths[index], // index에 따라 다른 이미지 사용
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: 360.w,
                      height: 52.h,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              //아이콘 모음
              Container(
                width: 360.w,
                height: 208.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Row(
                  children: [
                    Container(
                      width: 160.w,
                      height: 160.h,
                      child: Column(
                        children: [
                          Container(
                            width: 160.w,
                            height: 76.h,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 160.w,
                            height: 76.h,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 160.w,
                      height: 160.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.62, -0.79),
                          end: Alignment(-0.62, 0.79),
                          colors: [Color(0xFF8D6AF5), Color(0xFF4D17EE)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x4C8D6AF5),
                            blurRadius: 6,
                            offset: Offset(-1, -2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //좋아할 매장
              Container(
                width: 360.w,
                height: 423.h,
                color: Color(0xFF1A1A1A),
              )
            ],
          ),
        ),
      ),
    );
  }
}
