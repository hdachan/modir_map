import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MaterialApp(
    home: Filter(), // Filter 위젯을 홈으로 설정
  ));
}

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
      body: SafeArea( // SafeArea 추가
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 360.w,
                  height: 60.h,
                  padding: EdgeInsets.all(16),
                  color: Color(0xFF1A1A1A),
                  child: Text(
                    '필터',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                      letterSpacing: -0.50,
                    ),
                  ),
                ),
                Container(
                  width: 360.w,
                  height: 56.h,
                  color: Color(0xFF1A1A1A),
                ),
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
                Container(
                  width: 360.w,
                  height: 492.h,
                  color: Color(0xFF1A1A1A),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
