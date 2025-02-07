import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class _StoreInfoScreenState extends State<StoreInfoScreen> {
  int _selectedIndex = 0; // 선택된 버튼의 인덱스


  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index; // 버튼 클릭 시 인덱스 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 360.w,
                height: 180.h,
                color: Colors.cyan,
              ),
              Container(
                width: 360.w,
                height: 68.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _onButtonPressed(0),
                      child: Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Color(0xFF1A1A1A),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0xFF3D3D3D)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 8.h, bottom: 8),
                        child: Text(
                          '매장',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40.h,
                            letterSpacing: -0.35,
                            color: _selectedIndex == 0
                                ? Color(0xFF1A1A1A)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _onButtonPressed(1),
                      child: Container(
                        width: 56.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Color(0xFF1A1A1A),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0xFF3D3D3D)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 8.h, bottom: 8),
                        child: Text(
                          '코디',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40.h,
                            letterSpacing: -0.35,
                            color: _selectedIndex == 1
                                ? Color(0xFF1A1A1A)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded 대신 SizedBox 사용
              SizedBox(
                child: (() {
                  if (_selectedIndex == 0) {
                    return DataScreen4();
                  } else if (_selectedIndex == 1) {
                    return DataScreen5();
                  } else {
                    return DataScreen6(); // 세 번째 화면
                  }
                })(),
              ),
            ],
          ),
        ),
      ),
    );
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
          color: Color(0xFF1A1A1A),
          padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Container(
                width: 328.w,
                height: 28.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end, // 아래 정렬
                  children: [
                    Container(
                      width: 125.w,
                      height: 28.h,
                      child: Text(
                        'Grass Society',
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
                    SizedBox(width: 4.w),
                    Container(
                        width: 199.w,
                        height: 20.h,
                        child: Text(
                          '편집샵',
                          style: TextStyle(
                            color: Color(0xFFE7E7E7),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                            letterSpacing: -0.35,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              //영업중
              Container(
                width: 328.w,
                height: 20.h,
              ),
              SizedBox(height: 12.h),

              // 주소
              Container(
                width: 328.w,
                height: 20.h,
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Icon(
                        Icons.location_on, // 위치 아이콘
                        size: 20, // 아이콘 크기
                        color: Color(0xFF888888), // 아이콘 색상 (원하는 색상으로 변경 가능)
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 304.w,
                      height: 20.h,
                      child: Text(
                        '서울 성동구',
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
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              //웹사이트
              Container(
                width: 328.w,
                height: 20.h,
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Icon(
                        Icons.public, // 웹사이트 아이콘
                        size: 20, // 아이콘 크기
                        color: Color(0xFF888888), // 아이콘 색상
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 304.w,
                      height: 20.h,
                      child: Text(
                        'https://belier.co.kr/',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
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
          height: 108.h,
          color: Color(0xFF1A1A1A),
          padding: EdgeInsets.only(left: 60.w,right: 60,top: 16.h,bottom: 16.h),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 76.h,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white, // 흰색 아이콘
                          size: 24.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 32.w,
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
              SizedBox(width: 48.w),
              Container(
                width: 48.w,
                height: 76.h,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      child: Center(
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white, // 흰색 아이콘
                          size: 24.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 32.w,
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
              SizedBox(width: 48.w),
              Container(
                width: 48.w,
                height: 76.h,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      child: Center(
                        child: Icon(
                          Icons.ios_share,
                          color: Colors.white, // 흰색 아이콘
                          size: 24.sp, // 아이콘 크기 조정
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 32.w,
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
          height: 174.h,
          color: Color(0xFF1A1A1A),
          padding: EdgeInsets.only(top:24.h),
          child: Column(
            children: [
              Container(
                width: 360.w,
                height: 56.h,
                padding: EdgeInsets.only(left: 16.w,right: 16.w),
                child: Column(
                  children: [
                    Container(
                      width: 328.w,
                      height: 28.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start, // 상단에 배치
                        children: [
                          Container(
                            width: 300.w,
                            height: 28.h,
                            child: Text(
                              '이 매장을 선호하는 분들',
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
                          SizedBox(width: 4.w),
                          Container(
                            width: 20.w,
                            height: 20.h,
                            child: Center(
                              child: Icon(
                                Icons.warning_amber,
                                color: Colors.white, // 흰색 아이콘
                                size: 20.sp, // 아이콘 크기 조정
                              ),
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
                        '참고해서 원하는 매장을 쉽게 찾아 나만의 코디를 완성하세요',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
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
                height: 94.h,
                padding: EdgeInsets.all(16),
                child: Container(
                  width: 328.w,
                  height: 62.h,
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
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.09),
                              end: Alignment(-1, 0.09),
                              colors: _selectedIndextype == 0
                                  ? [Color(0xFF8D6AF5), Color(0xFF05FFF7)]
                                  : [Color(0xFF242424), Color(0xFF242424)], // 선택된 인덱스에 따라 색상 변경
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
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.09),
                              end: Alignment(-1, 0.09),
                              colors: _selectedIndextype == 1
                                  ? [Color(0xFF8D6AF5), Color(0xFF05FFF7)]
                                  : [Color(0xFF242424), Color(0xFF242424)], // 선택된 인덱스에 따라 색상 변경
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
            ],
          ),
        ),
        SizedBox(
          child: (() {
            if (_selectedIndextype == 0) {
              return style();
            }  else {
              return style1(); // 세 번째 화면
            }
          })(),
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

class DataScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('기타 화면입니다.'),
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
          height: 354.h,
          color: Colors.cyan,
          child: Column(
            children: [
              Container(
                width: 360.w,
                height: 214.h,
                color: Color(0xFF1A1A1A),
                child: Column(
                  children: [
                    Container(
                      width: 360.w,
                      height: 40.h,
                    ),
                    Container(
                      width: 360.w,
                      height: 174.h,
                      padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h),
                      child: Row(
                        children: [
                          Container(
                            width: 104.w,
                            height: 158.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            width: 104.w,
                            height: 158.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            width: 104.w,
                            height: 158.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
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
                height: 116.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.only(left: 16.w,right: 16.w,top:24.h,bottom: 24.w),
                child: Container(
                  width: 328.w,
                  height: 68.h,
                  child: Column(
                    children: [
                      Container(
                        width: 296.h,
                        height: 20.h,
                        child: Text(
                          '이 매장을 조회하신 분들은 ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 296.h,
                        height: 16.h,
                        child: Text(
                          '미니멀  성향의 분들이 매장을 자주 조회해요',
                          style: TextStyle(
                            color: Color(0xFFE7E7E7),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.30,
                            letterSpacing: -0.30,
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
      ],
    );
  }
}

class style1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}