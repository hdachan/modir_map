import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen_setting.dart';


class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 탭의 개수 설정
  }

  @override
  void dispose() {
    _tabController.dispose(); // 리소스 해제
    super.dispose();
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
                //상단바
                CustomAppBar(title: '필터', context: context),

                //필터 넣은 목록
                Container(
                  width: 360.w,
                  height: 56.h,
                  color: Color(0xFF1A1A1A),
                ),

                //탭바 디자인
                Container(
                  width: 360.w,
                  height: 54.h,
                  color: Color(0xFF1A1A1A),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: Color(0xFF8D6AF5), // 선택된 탭의 색상
                    unselectedLabelColor: Color(0xFFB0B0B0), // 선택되지 않은 탭의 색상
                    tabs: [
                      Tab(
                        child: Text(
                          '스타일',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          '브랜드',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                    ],
                    indicatorColor: Color(0xFF8D6AF5),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(top: 12, bottom: 0),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),

                //탭바 정보
                Container(
                  height: 570.h, // 적절한 높이 설정
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      style_screen(),
                      brand_screen(),
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


//스타일화면
class style_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 570.h,
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 24,top: 24),
      child: Column(
        children: [
          Row(
            children: [
              casualButton("캐주얼"),
              SizedBox(width: 16),
              casualButton("빈티지"),
              SizedBox(width: 16),
              casualButton("클래식"),
              SizedBox(width: 16),
              casualButton("스트릿"),
            ],
          ),
          SizedBox(height: 16), // Row 간의 간격 추가
          Row(
            children: [
              casualButton("스포티"),
              SizedBox(width: 16),
              casualButton("포멀"),
              SizedBox(width: 16),
              casualButton("미니멀"),
              SizedBox(width: 16),
              casualButton("워크웨어"),
            ],
          ),
          SizedBox(height: 16), // Row 간의 간격 추가
          Row(
            children: [
              casualButton("아메카지"),
              SizedBox(width: 16),
              casualButton("댄디."),
            ],
          ),
        ],
      ),
    );
  }
}

//브랜드화면
class brand_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 570.h,
      child: Column(
        children: [
          customSearchButton(context, () {
            // 버튼 클릭 시 동작
          }),
          // 다른 UI 요소들을 여기에 추가
        ],
      ),
    );
  }
}



// 버튼
Widget casualButton(String text) {
  return Container(
    width: 68.w,
    height: 36.h,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          height: 1.40,
          letterSpacing: -0.35,
        ),
      ),
    ),
  );
}



