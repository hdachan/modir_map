import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'map_provider.dart';  // ✅ MapProvider 가져오기

import 'SettingState.dart';
import 'animation.dart';
import 'filter.dart';
import 'search_screen.dart';

class NaverMapBackground extends StatefulWidget {
  @override
  _NaverMapBackgroundState createState() => _NaverMapBackgroundState();
}

class _NaverMapBackgroundState extends State<NaverMapBackground> {
  NaverMapController? _mapController; // 컨트롤러 저장

  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchData(); // 초기 데이터 불러오기
    dataProvider.setupRealtimeSubscription(); // 실시간 구독 설정
  }

  @override
  void dispose() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.disposeProvider(); // 리소스 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        // 데이터가 비어있을 경우 로딩 화면 표시
        if (dataProvider.dataList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(), // 로딩 바
              SizedBox(height: 20), // 로딩 바와 텍스트 사이 간격
              Text(
                '데이터가 비어 있습니다. 상태: ${dataProvider.dataList.isEmpty ? "비어 있음" : "데이터 있음"}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              Text(
                '데이터 로드 상태: ${dataProvider.isLoading ? "로딩 중" : "로딩 완료"}',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Text(
                '에러 메시지: ${dataProvider.errorMessage ?? "없음"}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Container(
              width: 360.w,
              child: Column(
                children: [
                  // 상단 부분
                  Container(
                    width: 360.w,
                    height: 80.h,
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(createFadeRoute(search_screen()));
                          },
                          child: Container(
                            width: 272.w,
                            height: 48.h,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h),
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
                                  child: Center(
                                    // 텍스트를 중앙에 배치
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
                        ),

                        SizedBox(width: 8.w), // 사이즈 박스 8픽셀
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(createSlideUpRoute(Filter())); // 아래에서 위로 올라오는 애니메이션 사용
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: Colors.transparent,
                            // 패딩을 0으로 설정
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            // 기본 배경색을 투명으로 설정
                            shadowColor: Colors.transparent, // 그림자 색상 제거
                          ),
                          child: Container(
                            width: 48.w,
                            height: 48.h,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.71, -0.71),
                                end: Alignment(-0.71, 0.71),
                                colors: [Color(0xFF4D17EE), Color(0xFF8D6AF5)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.tab_unselected,
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
                    color: Color(0xFF1A1A1A),
                    padding: EdgeInsets.only(
                        left: 16.w, top: 12.h, right: 16.w, bottom: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                      children: [
                        Container(
                          width: 80.w,
                          height: 32.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                  Consumer<MapProvider>(
                    builder: (context, mapProvider, child) {
                      return  Expanded(
                        child: Stack(
                          children: [
                            // 네이버 지도
                            NaverMap(
                              onMapReady: (controller) {
                                final mapProvider = Provider.of<MapProvider>(context, listen: false);
                                mapProvider.setMapController(controller); // ✅ 컨트롤러 설정
                                _updateMarkers(dataProvider);
                                print("NaverMap 컨트롤러 설정 완료!"); // 디버깅용

                                // ✅ 마커 추가
                                _mapController = controller; // 컨트롤러 저장
                                _updateMarkers(dataProvider); // 마커 업데이트
                              },
                            ),


                          ],
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void here(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 360.w,
          height: 222.h, // 높이 설정
          child: Column(
            children: [
              // 제목 영역 (둥근 모서리 추가)
              Container(
                width: 360.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.w), // 상단 왼쪽 둥근 모서리
                    topRight: Radius.circular(25.w), // 상단 오른쪽 둥근 모서리
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                child: Center(
                  child: Container(
                    width: 48.w,
                    height: 4.h,
                    color: Colors.white,
                  ),
                ),
              ),

              // 내용 영역
              Container(
                width: 360.w,
                height: 186.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24),
                child: Column(
                  children: [
                    Container(
                      width: 328.w,
                      height: 102.h,
                      color: Colors.cyan,
                      child: Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 100.h,
                            color: Colors.cyanAccent,
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: 216.w,
                            height: 102.h,
                            color: Colors.cyanAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 328.w,
                      height: 46.h,
                      color: Colors.cyan,
                      child: Row(
                        children: [
                          Container(
                            width: 265.w,
                            height: 48.h,
                            color: Colors.cyanAccent,
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 55.w,
                            height: 33.h,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  // 마커 리스트를 동적으로 생성하는 함수
  Set<NAddableOverlay> _buildMarkers(DataProvider dataProvider) {
    return dataProvider.dataList.map<NAddableOverlay>((item) {
      final double latitude = double.tryParse(item['mapy'].toString()) ?? 0;
      final double longitude = double.tryParse(item['mapx'].toString()) ?? 0;
      final String title = item['title'].toString();

      final marker = NMarker(
        id: title,
        position: NLatLng(latitude, longitude),
        caption: NOverlayCaption(text: title),
      );

      // 마커 클릭 리스너 추가
      marker.setOnTapListener((overlay) {
        here(context);
      });

      return marker;
    }).toSet();
  }


  // 데이터 변경 시 마커 업데이트
  void _updateMarkers(DataProvider dataProvider) {
    if (_mapController == null) return;

    final newMarkers = _buildMarkers(dataProvider);
    _mapController!.clearOverlays(); // 기존 마커 삭제
    _mapController!.addOverlayAll(newMarkers); // 새로운 마커 추가
  }
}

