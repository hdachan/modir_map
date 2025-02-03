import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NaverMapBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 740), // 디자인 기준 사이즈를 360으로 설정
      minTextAdapt: true,
      splitScreenMode: true,
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1A1A1A), // 상단바 투명
        statusBarIconBrightness: Brightness.light, // 아이콘을 밝은 색으로 설정
      ),
    );
    return Scaffold(
      body: SafeArea(
        child:  Container(
          width: 360.w,
          child: Column(
            children: [
              // 상단 부분
              Container(
                width: 360.w,
                height: 80.h,
                padding: EdgeInsets.only(top: 16.h,bottom: 16.h),
                decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 272.w,
                      height: 48.h,
                      padding: EdgeInsets.only(left: 16.h,right: 16.h),
                      decoration: ShapeDecoration(
                        color: Color(0x19320E99),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.w, color: Color(0xFF4D17EE)),
                          borderRadius: BorderRadius.circular(16.w),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.search, // 검색 아이콘 추가
                              color: Colors.white, // 아이콘 색상
                              size: 24, // 아이콘 크기
                            ),
                          ),
                          SizedBox(width: 4.w), // 간격 추가
                          Container(
                            width: 122.w,
                            height: 24.h,
                            child: Center( // 텍스트를 중앙에 배치
                              child: Text(
                                '브랜드, 매장, 위치 검색',
                                style: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.70,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w), // 사이즈 박스 8픽셀
                    Container(
                      width: 48.w,
                      height: 48.h,
                      padding: EdgeInsets.all(12.w),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w), // 모서리 둥글기 설정
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(0.71, -0.71),
                          end: Alignment(-0.71, 0.71),
                          colors: [Color(0xFF4D17EE), Color(0xFF8D6AF5)],
                        ),
                      ),
                      child: Icon(
                        Icons.tab_unselected,
                        color: Colors.white, // 아이콘 색상
                        size: 24.sp, // 아이콘 크기
                      ),

                    ),

                  ],
                ),
              ),

              Container(
                width: 360.w,
                height: 56.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.only(left: 16.w, top: 12.h, right: 16.w, bottom: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                  children: [
                    Container(
                      width: 80.w,
                      height: 32.h,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '빈티지',
                          style: TextStyle(
                            color: Color(0xFFF8F6FE),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.14,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 80.w,
                      height: 32.h,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '빈티지',
                          style: TextStyle(
                            color: Color(0xFFF8F6FE),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.14,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 80.w,
                      height: 32.h,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3D3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '빈티지',
                          style: TextStyle(
                            color: Color(0xFFF8F6FE),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.14,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              // 네이버 지도 부분
              Expanded(
                child: Stack(
                  children: [
                    // 네이버 지도
                    NaverMap(
                      onMapReady: (controller) {
                        final marker = NMarker(
                          id: 'test',
                          position: const NLatLng(36.1234229,128.1146402),
                        );
                        controller.addOverlay(marker);

                        // 마커 클릭 이벤트 처리
                        marker.setOnTapListener((NMarker tappedMarker) {
                          here(context, "마커 클릭", "마커 ID: ${tappedMarker.info.id}");
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void here(BuildContext context, String title, String content) {
    OverlayState? overlayState = Overlay.of(context);

    // OverlayEntry 선언
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 56.h, // 하단에 고정
        left: 0,
        right: 0,
        child: Material(
          elevation: 8.0,
          child: Container(
            width: 360.w,
            height: 236.h, // 높이 설정
            color: Colors.white,
            child: Column(
              children: [
                // 제목 영역
                Container(
                  width: 360.w,
                  height: 36.h,
                  color: Colors.white,
                  ),
                // 닫기 버튼 영역
                Container(
                  width: 360.w,
                  height: 52.h,
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      overlayEntry.remove(); // 오버레이 제거
                    },
                    child: Text(
                      '닫기',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // 오버레이 추가
    overlayState.insert(overlayEntry);
  }
}
