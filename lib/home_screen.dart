import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/search_screen.dart';

import 'screen_setting.dart';

void main() {
  runApp(MaterialApp(
    home: Setting(), // Setting 위젯을 홈으로 설정
  ));
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          // floor()를 사용하여 현재 페이지를 업데이트
          _currentPage = _pageController.page!.floor();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 396.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.only(top: 24),
                // 상단에 24의 패딩 설정
                child: Column(
                  children: [
                    // 페이지 뷰
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index; // 페이지가 변경될 때마다 현재 페이지 업데이트
                          });
                        },
                        children: [
                          Container(
                            color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  width: 360.w,
                                  height: 100.h,
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  // 상단에 24의 패딩 설정
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 328.w,
                                        height: 68.h,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 248.w,
                                              height: 68.h,
                                              child: Text(
                                                '패션인들이 선택한\n서울 매장 루트 리스트',
                                                style: TextStyle(
                                                  color: Color(0xFFF6F6F6),
                                                  fontSize: 24,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.40,
                                                  letterSpacing: -0.60,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              // 상단 중앙 정렬
                                              child: Container(
                                                width: 80.w,
                                                height: 32.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children:
                                                      List.generate(4, (index) {
                                                    return Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.0),
                                                      // 동그라미 간격
                                                      width: 8.0,
                                                      // 동그라미 너비
                                                      height: 8.0,
                                                      // 동그라미 높이
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: index == 0
                                                            ? Colors.white
                                                            : Colors
                                                                .grey, // 현재 페이지에 따라 색상 변경
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Container(
                                        width: 328.w,
                                        height: 20.h,
                                        child: Text(
                                          '#홍대 #포멀 #미니멀',
                                          style: TextStyle(
                                            color: Color(0xFFBFACF9),
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
                                Container(
                                  width: 360.w,
                                  height: 272.h,
                                  padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 24,
                                      top: 24.h), // 상단에 24의 패딩 설정
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 328.w,
                                        height: 64.h,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF4D17EE)),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Container(
                                        width: 328.w,
                                        height: 64.h,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF4D17EE)),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Container(
                                        width: 328.w,
                                        height: 64.h,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF4D17EE)),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.green,
                            child: Center(child: Text('Page 2')),
                          ),
                          Container(
                            color: Colors.blue,
                            child: Center(child: Text('Page 3')),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: Center(child: Text('Page 4')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 인디케이터
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0), // 동그라미 간격
                    width: 8.0, // 동그라미 너비
                    height: 8.0, // 동그라미 높이
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentPage
                          ? Colors.white
                          : Colors.grey, // 현재 페이지에 따라 색상 변경
                    ),
                  );
                }),
              ),

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
