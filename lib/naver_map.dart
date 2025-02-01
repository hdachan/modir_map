import 'package:flutter/material.dart';
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

    return Container(
      width: 360.w,
      child: Column(
        children: [
          // 상단 부분
          Container(
            width: 360.w,
            height: 80.h,
            padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w, bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Color(0xFFE7E7E7)),
                top: BorderSide(color: Color(0xFFE7E7E7)),
                right: BorderSide(color: Color(0xFFE7E7E7)),
                bottom: BorderSide(width: 1.w, color: Color(0xFFE7E7E7)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 270.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Color(0xFFE7E7E7)),
                      borderRadius: BorderRadius.circular(8.w), // 둥글게 모서리 설정
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none, // 기본 테두리 제거
                      contentPadding: EdgeInsets.only(left: 16.w, top: 12.h, right: 16.w, bottom: 12.h), // 패딩 설정
                      hintText: '스타일, 브랜드, 매장, 위치 검색', // 힌트 텍스트
                      hintStyle: TextStyle(
                        color: Color(0xFF888888), // 힌트 텍스트 색상
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFF888888), // 입력 텍스트 색상
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.70,
                      letterSpacing: -0.35,
                    ),
                  ),
                ),
                SizedBox(width: 8.w), // 사이즈 박스 8픽셀
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF4D17EE), // 새로운 색상
                    borderRadius: BorderRadius.circular(8.w), // 둥글게 모서리 설정
                  ),
                  padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 12.w, bottom: 12.h),
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white, // 아이콘 색상
                      size: 24.sp, // 아이콘 크기
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 360.w,
            height: 56.h,
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.w, top: 12.h, right: 16.w, bottom: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
              children: [
                Container(
                  width: 328.w,
                  height: 48.h,
                  color: Colors.white, // 내부 컨테이너 색상
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


