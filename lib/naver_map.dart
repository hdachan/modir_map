import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'map_provider.dart'; // ✅ MapProvider 가져오기

import 'SettingState.dart';
import 'animation.dart';
import 'filter.dart';
import 'search_screen.dart';
import 'store.dart';

class NaverMapBackground extends StatefulWidget {
  @override
  _NaverMapBackgroundState createState() => _NaverMapBackgroundState();
}

class _NaverMapBackgroundState extends State<NaverMapBackground> {
  NaverMapController? _mapController; // 컨트롤러 저장

  Future<void> _moveToCurrentLocation() async {
    if (_mapController == null) {
      print("MapController가 아직 설정되지 않음!");
      return;
    }

    // 위치 권한 확인 및 요청
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("위치 서비스가 비활성화되어 있음.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print("위치 권한이 영구적으로 거부되었습니다.");
        return;
      }
    }

    // 현재 위치 가져오기
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 지도 카메라를 현재 위치로 이동
      final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
        target: NLatLng(position.latitude, position.longitude),
        zoom: 15, // 적절한 줌 레벨
      );
      await _mapController!.updateCamera(cameraUpdate);
      print("현재 위치로 이동 완료: ${position.latitude}, ${position.longitude}");
    } catch (e) {
      print("위치 정보를 가져오는 중 오류 발생: $e");
    }
  }

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
                            Navigator.of(context)
                                .push(createFadeRoute(search_screen()));
                          },
                          child: Container(
                            width: 272.w,
                            height: 48.h,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h),
                            decoration: ShapeDecoration(
                              color: Color(0x19320E99),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.w, color: Color(0xFF4D17EE)),
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
                            Navigator.of(context).push(createSlideUpRoute(
                                Filter())); // 아래에서 위로 올라오는 애니메이션 사용
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
                  ElevatedButton(
                    onPressed: () {
                      _updateMarkers(dataProvider); // 현재 지도 화면 기준으로 마커 업데이트
                    },
                    child: Text("새로고침"),
                  ),

                  // 네이버 지도 부분
                  Consumer<MapProvider>(
                    builder: (context, mapProvider, child) {
                      return Expanded(
                        child: Stack(
                          children: [
                            // 네이버 지도
                            NaverMap(
                              onMapReady: (controller) {
                                final mapProvider = Provider.of<MapProvider>(
                                    context,
                                    listen: false);
                                mapProvider
                                    .setMapController(controller); // ✅ 컨트롤러 설정
                                _updateMarkers(dataProvider);
                                print("NaverMap 컨트롤러 설정 완료!"); // 디버깅용

                                // ✅ 마커 추가
                                _mapController = controller; // 컨트롤러 저장
                                _updateMarkers(dataProvider); // 마커 업데이트
                              },
                              options: NaverMapViewOptions(
                                initialCameraPosition: NCameraPosition(
                                  target: NLatLng(36.1234229, 128.1146402),
                                  // 초기 위치
                                  zoom: 15,
                                  // 초기 줌 레벨
                                  bearing: 0,
                                  // 초기 방향
                                  tilt: 0, // 초기 기울기
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: GestureDetector(
                                onTap: _moveToCurrentLocation,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(Icons.my_location,
                                      color: Colors.black),
                                ),
                              ),
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

  void here(BuildContext context, String address, String roadAddress, String type, String title) {
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreInfoScreen(
                        title: title,
                        address: address,
                        roadAddress: roadAddress,
                        type: type,
                      ),
                    ),
                  );
                },

                child: Container(
                  width: 360.w,
                  height: 186.h,
                  color: Color(0xFF1A1A1A),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
                  child: Column(
                    children: [
                      Container(
                        width: 328.w,
                        height: 102.h,
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              color: Colors.red,
                            ),
                            SizedBox(width: 12.w),
                            Container(
                              width: 216.w,
                              height: 102.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 216.w,
                                    height: 46.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                                      crossAxisAlignment: CrossAxisAlignment.start, // 위쪽 정렬
                                      children: [
                                        Container(
                                          width: 164.w,
                                          height: 46.h,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 164.w,
                                                height: 20.h,
                                                child: Text(
                                                  '$type',
                                                  style: TextStyle(
                                                    color: Color(0xFFE7E7E7),
                                                    fontSize: 14,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.40.h,
                                                    letterSpacing: -0.35,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 164.w,
                                                height: 26.h,
                                                child: Text(
                                                  '$title',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.30,
                                                    letterSpacing: -0.50,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 52.w,
                                          height: 20.h,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 20.w,
                                                height: 20.h,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF1CD14F),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12.w),
                                              Container(
                                                width: 20.w,
                                                height: 20.h,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1, color: Color(0xFFFD3D51)),
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 216.w,
                                    height: 20.h,
                                    child: Text(
                                      '영업 중 · 20:00에 영업 종료',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 216.w,
                                    height: 20.h,
                                    child: Text(
                                      '렉토 · 벨리에 · UGG',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
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
                      SizedBox(height: 12),
                      Container(
                        width: 328.w,
                        height: 48.h,
                        child: Row(
                          children: [
                            Container(
                              width: 265.w,
                              height: 48.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 265.w,
                                    height: 20.h,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '추천  ·  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                              height: 1.40,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '스트릿',
                                            style: TextStyle(
                                              color: Color(0xFF05FFF7),
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                              height: 1.40,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '을 선호하는 분들',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                              height: 1.40,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 265.w,
                                    height: 20.h,
                                    child: Text(
                                      '주소  ·  $address ',
                                      style: TextStyle(
                                        color: Color(0xFFD1D1D1),
                                        fontSize: 14,
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
                            SizedBox(width: 8),
                            Container(
                              width: 55.w,
                              height: 33.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: ShapeDecoration(
                                color: Color(0xFF3D3D3D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '길찾기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40.h,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // 마커 리스트를 동적으로 생성하는 함수
  Set<NAddableOverlay> _buildMarkersFromList(List<dynamic> dataList) {
    return dataList.map<NAddableOverlay>((item) {
      final double latitude = double.tryParse(item['mapy'].toString()) ?? 0;
      final double longitude = double.tryParse(item['mapx'].toString()) ?? 0;
      final String title = item['title'].toString();
      final String address = item['address']?.toString() ?? '주소 없음'; // 주소
      final String roadAddress = item['roadAddress']?.toString() ?? '로도명 주소 없음'; // 도로명주소
      final String type = item['type']?.toString() ?? '종류 없음'; // 매장 타입

      final marker = NMarker(
        id: title,
        position: NLatLng(latitude, longitude),
        caption: NOverlayCaption(text: address),
        icon: NOverlayImage.fromAssetImage('assets/image/marker_off.png'),
        // 커스텀 마커 이미지
        size: const Size(40, 40),
      );

      marker.setOnTapListener((overlay) {
        here(context, address, roadAddress ,type, title);
      });

      return marker;
    }).toSet();
  }

  // 데이터 변경 시 마커 업데이트
  Future<void> _updateMarkers(DataProvider dataProvider) async {
    if (_mapController == null) return;

    try {
      // 현재 보이는 지도 영역(뷰포트) 가져오기
      final bounds = await _mapController!.getContentBounds();
      if (bounds == null) return;

      // 뷰포트 내에 있는 데이터만 필터링
      final filteredData = dataProvider.dataList.where((data) {
        final double lat = double.tryParse(data['mapy'].toString()) ?? 0; // 위도
        final double lng = double.tryParse(data['mapx'].toString()) ?? 0; // 경도

        return lat >= bounds.southWest.latitude &&
            lat <= bounds.northEast.latitude &&
            lng >= bounds.southWest.longitude &&
            lng <= bounds.northEast.longitude;
      }).toList();

      // 새로운 마커 생성
      final newMarkers = _buildMarkersFromList(filteredData);

      // 기존 마커 삭제 후 새로운 마커 추가
      _mapController!.clearOverlays();
      _mapController!.addOverlayAll(newMarkers);
    } catch (e) {
      print("마커 업데이트 중 오류 발생: $e");
    }
  }
}
