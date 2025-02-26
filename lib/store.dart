import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter.dart';
import 'screen_setting.dart';
import 'store_information.dart';

class StoreInfoScreen extends StatefulWidget {
  final String title;
  final String address;
  final String roadAddress;
  final String type;

  const StoreInfoScreen({
    Key? key,
    required this.title,
    required this.address,
    required this.roadAddress,
    required this.type,
  }) : super(key: key);

  @override
  _StoreInfoScreenState createState() => _StoreInfoScreenState();
}

class _StoreInfoScreenState extends State<StoreInfoScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0; // 선택된 버튼의 인덱스

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index; // 버튼 클릭 시 인덱스 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 스크롤 되는 첫 번째 컨테이너
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    width: 360.w,
                    height: 360.h,
                    child: Image.asset(
                      'assets/image/store_test01.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 12.w, // 왼쪽 위 아이콘의 x 위치
                    top: 12.h, // 왼쪽 위 아이콘의 y 위치
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // 뒤로가기 기능
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        padding: EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: Color(0xB21A1A1A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined, // 수평 점세게 메뉴 아이콘
                          size: 20.sp, // 아이콘 크기
                          color: Colors.white, // 아이콘 색상
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12.w, // 오른쪽 위 아이콘의 x 위치
                    top: 12.h, // 오른쪽 위 아이콘의 y 위치
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: ShapeDecoration(
                        color: Color(0xB21A1A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        child: Center(
                          // 아이콘을 중앙에 배치하기 위해 Center 위젯을 사용
                          child: Icon(
                            Icons.more_vert_outlined, // 수평 점세게 메뉴 아이콘
                            size: 24.w, // 아이콘 크기
                            color: Colors.white, // 아이콘 색상
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.w, // 왼쪽 아래 아이콘의 x 위치
                    bottom: 12.h, // 왼쪽 아래 아이콘의 y 위치
                    child: Container(
                      width: 114.w,
                      height: 20.h,
                      padding:
                          EdgeInsets.only(left: 8, right: 4, top: 2, bottom: 2),
                      decoration: ShapeDecoration(
                        color: Color(0xB21A1A1A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 37.w,
                            height: 16.h,
                            child: Text(
                              '10 : 00',
                              style: TextStyle(
                                color: Color(0xFF1CD14F),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.30.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 16.h,
                            child: Text(
                              '|',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.30.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 37.w,
                            height: 16.h,
                            child: Text(
                              '23 : 00',
                              style: TextStyle(
                                color: Color(0xFFFF3333),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.30.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          Container(
                            width: 16.w,
                            height: 16.h,
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined, // 아이콘
                              size: 12.sp, // 아이콘 크기
                              color: Color(0xFF888888), // 아이콘 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12.w, // 오른쪽 아래 아이콘의 x 위치
                    bottom: 12.h, // 오른쪽 아래 아이콘의 y 위치
                    child: Container(
                      width: 43.w,
                      height: 20.h,
                      decoration: ShapeDecoration(
                        color: Color(0xB21A1A1A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1.30.h,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.30,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              TextSpan(
                                text: '/ 12',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.30.h,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 탭 컨테이너를 슬리버로 감싸고 pinned 속성을 true로 설정
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 48.h,
                maxHeight: 48.h,
                child: Container(
                  width: 360.w,
                  height: 48.h,
                  color: const Color(0xFF1A1A1A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      // 매장 버튼
                      GestureDetector(
                        onTap: () => _onButtonPressed(0),
                        child: Container(
                          width: 53.w,
                          height: 32.h,
                          decoration: ShapeDecoration(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: const Color(0xFF3D3D3D)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '매장',
                            style: TextStyle(
                              color: _selectedIndex == 0
                                  ? const Color(0xFF1A1A1A)
                                  : Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // 코디 버튼
                      GestureDetector(
                        onTap: () => _onButtonPressed(1),
                        child: Container(
                          width: 53.w,
                          height: 32.h,
                          decoration: ShapeDecoration(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: const Color(0xFF3D3D3D)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '코디',
                            style: TextStyle(
                              color: _selectedIndex == 1
                                  ? const Color(0xFF1A1A1A)
                                  : Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // 정보 버튼
                      GestureDetector(
                        onTap: () => _onButtonPressed(2),
                        child: Container(
                          width: 53.w,
                          height: 32.h,
                          decoration: ShapeDecoration(
                            color: _selectedIndex == 2
                                ? Colors.white
                                : const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: const Color(0xFF3D3D3D)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '정보',
                            style: TextStyle(
                              color: _selectedIndex == 2
                                  ? const Color(0xFF1A1A1A)
                                  : Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 스크롤 되는 콘텐츠 영역
            SliverToBoxAdapter(
              child: SizedBox(
                child: (() {
                  if (_selectedIndex == 0) {
                    return DataScreen4();
                  } else if (_selectedIndex == 1) {
                    return DataScreen5();
                  } else {
                    return DataScreen6();
                  }
                })(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:LoginButton(
        buttonText: '예약하기', // 로그인 텍스트 전달
        onTap:  () => print("qwe"),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class DataScreen4 extends StatefulWidget {
  @override
  _DataScreen4State createState() => _DataScreen4State();
}

class _DataScreen4State extends State<DataScreen4> {
  int _selectedIndextype = 0;

  void _onButtontypePressed(int index) {
    setState(() {
      _selectedIndextype = index; // 버튼 클릭 시 인덱스 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360.w,
          height: 56.h,
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 265.w,
                height: 28.h,
                child: Row(
                  children: [
                    Container(
                      width: 125.w,
                      height: 28.h,
                      child: Text(
                        'Grass Society',
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
                    SizedBox(width: 4.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end, // 아래 정렬
                      children: [
                        Container(
                          width: 136.w,
                          height: 20.h,
                          child: Text(
                            '편집샵',
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 55.w,
                height: 24.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0xFF3D3D3D)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      child: Center(
                        // 아이콘을 중앙에 배치하기 위해 Center 위젯 사용
                        child: Icon(
                          Icons.notifications_outlined, // 종 아이콘
                          color: Color(0xFF3D3D3D), // 아이콘 색상
                          size: 16.sp, // 아이콘 크기
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      width: 21.w,
                      height: 16.h,
                      child: Text(
                        '공지',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.1.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //주소
        Container(
          width: 360.w,
          height: 32.h,
          padding: EdgeInsets.only(left: 16, right: 8, top: 2, bottom: 2),
          child: Row(
            children: [
              Container(
                width: 188.w,
                height: 28.h,
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF888888), // 아이콘 색상
                          size: 20.sp, // 아이콘 크기
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 164.w,
                      height: 20.h,
                      child: Text(
                        '서울 성동구 서울숲4길 15, 2층',
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
              SizedBox(width: 4.w),
              Container(
                width: 40.w,
                height: 28.h,
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Text(
                  '복사',
                  style: TextStyle(
                    color: Color(0xFF05FFF7),
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
        // 전화
        Container(
          width: 360.w,
          height: 32.h,
          padding: EdgeInsets.only(left: 16, right: 8, top: 2, bottom: 2),
          child: Row(
            children: [
              Container(
                width: 114.w,
                height: 28.h,
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.call,
                          color: Color(0xFF888888), // 아이콘 색상
                          size: 20.sp, // 아이콘 크기
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 90.w,
                      height: 20.h,
                      child: Text(
                        '02-1234-5678',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.3.h,
                          letterSpacing: -0.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 40.w,
                height: 28.h,
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Text(
                  '복사',
                  style: TextStyle(
                    color: Color(0xFF05FFF7),
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
        //웹사이트
        Container(
          width: 360.w,
          height: 32.h,
          padding: EdgeInsets.only(left: 16, right: 8, top: 2, bottom: 2),
          child: Row(
            children: [
              Container(
                width: 336.w,
                height: 28.h,
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.public,
                          color: Color(0xFF888888), // 아이콘 색상
                          size: 20.sp, // 아이콘 크기
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 312.w,
                      height: 20.h,
                      child: Text(
                        'https://belier.co.kr/',
                        style: TextStyle(
                          color: Color(0xFF05FFF7),
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.40.h,
                          letterSpacing: -0.35,
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
          width: 360.w,
          height: 68.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Container(
            width: 328.w,
            height: 44.h,
            decoration: ShapeDecoration(
              color: Color(0xFF242424),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: Color(0xFF3D3D3D)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                '매장 정보 더보기',
                style: TextStyle(
                  color: Color(0xFFE7E7E7),
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.40.h,
                  letterSpacing: -0.35,
                ),
              ),
            ),
          ),
        ),

        Container(
          width: 360.w,
          height: 96.h,
          color: Color(0xFF1A1A1A),
          padding:
              EdgeInsets.only(left: 16.w, right: 16, top: 16.h, bottom: 16.h),
          child: Row(
            children: [
              Container(
                width: 76.w,
                height: 64.h,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white, // 흰색 아이콘
                          size: 20.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 24.w,
                      height: 20.h,
                      child: Text(
                        '관심',
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
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 76.w,
                height: 64.h,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white, // 흰색 아이콘
                          size: 20.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 24.w,
                      height: 20.h,
                      child: Text(
                        '문의',
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
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 76.w,
                height: 64.h,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.near_me_outlined,
                          color: Colors.white, // 흰색 아이콘
                          size: 20.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 36.w,
                      height: 20.h,
                      child: Text(
                        '길찾기',
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
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 76.w,
                height: 64.h,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Center(
                        child: Icon(
                          Icons.ios_share,
                          color: Colors.white, // 흰색 아이콘
                          size: 20.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 24.w,
                      height: 20.h,
                      child: Text(
                        '공유',
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
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 360.w,
          height: 44.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Row(
            children: [
              Container(
                width: 308.w,
                height: 20.h,
                child: Text(
                  '이 매장을 선호하는 분들',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.10.h,
                    letterSpacing: -0.45,
                  ),
                ),
              ),
              Container(
                width: 20.w,
                height: 20.h,
                child: Center(
                  child: Icon(
                    Icons.error_outline, // 동그라미 느낌표 아이콘
                    color: Colors.white, // 아이콘 색상 (필요에 따라 조정)
                    size: 20.sp, // 아이콘 크기
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 360.w,
          height: 84.h,
          padding: EdgeInsets.all(16),
          child: Container(
            width: 328.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _onButtontypePressed(0),
                  child: Container(
                    width: 152.w,
                    height: 44.h,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.09),
                        end: Alignment(-1, 0.09),
                        colors: _selectedIndextype == 0
                            ? [Color(0xFF8D6AF5), Color(0xFF05FFF7)]
                            : [
                                Color(0xFF242424),
                                Color(0xFF242424)
                              ], // 선택된 인덱스에 따라 색상 변경
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      '선호 패션',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.40,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () => _onButtontypePressed(1),
                  child: Container(
                    width: 152.w,
                    height: 42.h,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.09),
                        end: Alignment(-1, 0.09),
                        colors: _selectedIndextype == 1
                            ? [Color(0xFF8D6AF5), Color(0xFF05FFF7)]
                            : [
                                Color(0xFF242424),
                                Color(0xFF242424)
                              ], // 선택된 인덱스에 따라 색상 변경
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      '입점 브랜드',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          child: (() {
            if (_selectedIndextype == 0) {
              return style();
            } else {
              return style1(); // 세 번째 화면
            }
          })(),
        ),
        Container(
          width: 360.w,
          height: 92.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Container(
            width: 328.w,
            height: 68.h,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, -0.08),
                end: Alignment(-1, 0.08),
                colors: [Color(0xFF242424), Color(0x4C242424)],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
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
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              children: [
                Container(
                  width: 296.w,
                  height: 20.h,
                  child: Text(
                    '이 매장을 조회하신 분들은 ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.40.h,
                      letterSpacing: -0.35,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 296.w,
                  height: 16.h,
                  child: Row(
                    children: [
                      Container(
                        width: 31.w,
                        height: 16.h,
                        child: Text(
                          '미니멀',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF05FFF7),
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.30.h,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 263.w,
                        height: 16.h,
                        child: Text(
                          '성향의 분들이 매장을 자주 조회해요',
                          style: TextStyle(
                            color: Color(0xFFE7E7E7),
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.30.h,
                            letterSpacing: -0.30,
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
        Container(
          width: 360.w,
          height: 44.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Row(
            children: [
              Container(
                width: 328.w,
                height: 20.h,
                child: Text(
                  '공지방',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.10.h,
                    letterSpacing: -0.45,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 360.w,
          height: 32.h,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                width: 37.w,
                height: 24.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                alignment: Alignment.center,
                // 텍스트를 중앙에 정렬
                child: Text(
                  '신상',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.3.h,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 37.w,
                height: 24.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                alignment: Alignment.center,
                // 텍스트를 중앙에 정렬
                child: Text(
                  '품절',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.3.h,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        ),
        Container(
          width: 360.w,
          height: 128.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 104.w,
                height: 104.h,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                    image: AssetImage('assets/image/test_image.png'),
                    fit: BoxFit.cover, // 이미지를 컨테이너에 맞게 조정
                  ),
                ),
              ),
              Container(
                width: 224.w,
                height: 104.h,
                padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFF242424),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 200.w,
                      height: 20.h,
                      child: Text(
                        '나이스웨더 성수점',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.40.h,
                          letterSpacing: -0.35,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 200.w,
                      height: 16.h,
                      child: Text(
                        '안녕하세요 나이스웨더입니다. 이벤트 및 신상 정보를 빠르게 얻어가세요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.30.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 200.w,
                      height: 16.h,
                      child: Row(
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.h,
                            child: Icon(
                              Icons.perm_identity_outlined, // 아이콘
                              size: 16.sp, // 아이콘 크기
                              color: Color(0xFF888888), // 아이콘 색상
                            ),
                          ),
                          SizedBox(width: 4.h),
                          Container(
                            width: 180.w,
                            height: 16.h,
                            alignment: Alignment.centerLeft, // 중앙 왼쪽 정렬
                            child: Text(
                              '23',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.10.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 200.w,
                      height: 24.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 정렬
                        children: [
                          Container(
                            height: 24.h,
                            padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            alignment: Alignment.center, // 중앙 정렬
                            child: Text(
                              '입장하기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.10.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),

              ),
            ],
          ),
        ),
        Container(
          width: 360.w,
          height: 332.h,
        ),
      ],
    );
  }
}

class DataScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('브랜드 화면입니다.'),
    );
  }
}



class style extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360.w,
          height: 40.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                child: Center(
                  child: Icon(
                    Icons.perm_identity_outlined, // 시계 아이콘
                    color: Colors.white, // 아이콘 색상
                    size: 16.sp, // 아이콘 크기
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 257.w,
                height: 16.h,
                child: Text(
                  '192명 참여',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.30.h,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Container(
                width: 51.w,
                height: 16.h,
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time, // 시계 아이콘
                      color: Colors.white, // 아이콘 색상
                      size: 16.sp, // 아이콘 크기
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 31.w,
                      height: 16.h,
                      child: Text(
                        '실시간',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2.h,
                          letterSpacing: -0.30,
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
          width: 360.w,
          height: 178.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end, // 자식들을 위쪽으로 정렬
            children: [
              Container(
                width: 104.w,
                height: 162.h,
                padding: EdgeInsets.only(bottom: 4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 104.w,
                      height: 34.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '미니멀',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.30.h,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 42.w,
                      height: 80.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 104.w,
                      height: 20.h,
                      child: Text(
                        '46%',
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
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 104.w,
                height: 134.h,
                padding: EdgeInsets.only(bottom: 4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 104.w,
                      height: 34.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '포멀',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.30.h,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 42.w,
                      height: 52.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 104.w,
                      height: 20.h,
                      child: Text(
                        '24%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
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
              SizedBox(width: 8.w),
              Container(
                width: 104.w,
                height: 113.h,
                child: Column(
                  children: [
                    Container(
                      width: 104.w,
                      height: 34.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '댄디',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.30.h,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 42.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 104.w,
                      height: 20.h,
                      child: Text(
                        '17%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
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
            ],
          ),
        ),
      ],
    );
  }
}

class style1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360.w,
          height: 40.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                child: Center(
                  child: Icon(
                    Icons.tag_outlined, // 시계 아이콘
                    color: Colors.white, // 아이콘 색상
                    size: 16.sp, // 아이콘 크기
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 257.w,
                height: 16.h,
                child: Text(
                  '8개의 브랜드 입점',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.30.h,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
            ],
          ),
        ),
        Container(
          width: 360.w,
          height: 178.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: SingleChildScrollView( // 스크롤 가능하게 만듭니다.
            scrollDirection: Axis.horizontal, // 수평 스크롤 설정
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // 자식들을 위쪽으로 정렬
              children: [
                Container(
                  width: 100.w,
                  height: 154.h,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//Frame%203132.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 54.h,
                        padding:EdgeInsets.only(left: 4,right: 8,top: 8,bottom: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 88.w,
                              height: 14.h,
                              child: Text(
                                '스투시',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.30.h,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 88.w,
                              height: 16.h,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.h,
                                    child: Icon(
                                      Icons.favorite, // 아이콘
                                      size: 16.sp, // 아이콘 크기
                                      color: Colors.white, // 아이콘 색상
                                    ),
                                  ),

                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 68.w,
                                    height: 16.h,
                                    child: Text(
                                      '45,952',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.10.h,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24.w),
                Container(
                  width: 100.w,
                  height: 154.h,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//Frame%203132.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 54.h,
                        padding:EdgeInsets.only(left: 4,right: 8,top: 8,bottom: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 88.w,
                              height: 14.h,
                              child: Text(
                                '스투시',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.30.h,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 88.w,
                              height: 16.h,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.h,
                                    child: Icon(
                                      Icons.favorite, // 아이콘
                                      size: 16.sp, // 아이콘 크기
                                      color: Colors.white, // 아이콘 색상
                                    ),
                                  ),

                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 68.w,
                                    height: 16.h,
                                    child: Text(
                                      '45,952',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.10.h,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24.w),
                Container(
                  width: 100.w,
                  height: 154.h,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://ceckhzfboykmsshamikv.supabase.co/storage/v1/object/public/image//Frame%203132.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 54.h,
                        padding:EdgeInsets.only(left: 4,right: 8,top: 8,bottom: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 88.w,
                              height: 14.h,
                              child: Text(
                                '스투시',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.30.h,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 88.w,
                              height: 16.h,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.h,
                                    child: Icon(
                                      Icons.favorite, // 아이콘
                                      size: 16.sp, // 아이콘 크기
                                      color: Colors.white, // 아이콘 색상
                                    ),
                                  ),

                                  SizedBox(width: 4.w),
                                  Container(
                                    width: 68.w,
                                    height: 16.h,
                                    child: Text(
                                      '45,952',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.10.h,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
