import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/search_screen.dart';

import 'My_Page.dart';
import 'animation.dart';
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
            child: SvgPicture.network(
              "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_1.svg", // 네트워크 SVG 이미지 경로
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
            child: SvgPicture.network(
              "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_3.svg", // 네트워크 SVG 이미지 경로
              fit: BoxFit.fill, // 이미지 크기 조정
            ),
          ),
        );

      case 3:
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
            child: SvgPicture.network(
              "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_4.svg", // 네트워크 SVG 이미지 경로
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //상단 바
                buildAppBar(),
                //검색
                Container(
                  width: 360.w,
                  height: 48.h,
                  padding: EdgeInsets.only(top:6,bottom: 6),
                  child:Container(
                    width: 328.w,
                    height: 36.h,
                    padding: EdgeInsets.only(right:16,left: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(createFadeRoute(search_screen()));
                          },
                          child: Container(
                            width: 328.w,
                            height: 36.h,
                            padding: EdgeInsets.only(left:16,right:12,top: 8, bottom: 8),
                            decoration: ShapeDecoration(
                              color: Color(0xFF3D3D3D),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Icon(
                                    Icons.search, // 검색 아이콘 추가
                                    color: Color(0xFF888888), // 아이콘 색상
                                    size: 20.sp, // 아이콘 크기
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Container(
                                  width: 276.w,
                                  height: 20.h,
                                  child: Text(
                                    '매장, 위치 검색',
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.40,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                ),

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
                                    "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_1.svg",
                                    "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_2.svg",
                                    "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_3.svg",
                                    "https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//advertisement_4.svg",
                                  ];

                                  return Column(
                                    children: [
                                      GestureDetector(
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
                                            child: SvgPicture.network(
                                              imagePaths[index], // 모든 이미지를 네트워크 SVG 이미지로 사용
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // 각 버튼 사이에 8의 간격을 주기 위한 SizedBox
                                      if (index < 3) SizedBox(height: 8.h), // 마지막 버튼 이후에는 간격을 주지 않음
                                    ],
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
                        padding: EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.00, -0.08),
                            end: Alignment(-1, 0.08),
                            colors: [Color(0xFF242424), Color(0x4C242424)],
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Color(0xFF242424)),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
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
                        child: Text(
                          '지금 확인하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF05FFF7),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40.h,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                middleText('바로가기'),
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
                          color: Color(0xFF3F3F3F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
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
      ),
    );
  }
}
