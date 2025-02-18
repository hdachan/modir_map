import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

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
  bool _showRefreshButton = false;
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
                '데이터가 비어 있습니다. 상태: ${dataProvider.dataList.isEmpty
                    ? "비어 있음"
                    : "데이터 있음"}',
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
        final filterProvider = Provider.of<FilterProvider>(context);
        return Scaffold(
          backgroundColor: Color(0xFF1A1A1A),
          body: SafeArea(
            child: Container(
              width: 360.w,
              child: Column(
                children: [
                  // 상단 부분
                  Container(
                    width: 360.w,
                    height: 48.h,
                    padding: EdgeInsets.only(top:6,bottom: 6),
                    child:Container(
                      width: 360.w,
                      height: 36.h,
                      padding: EdgeInsets.only(right:16,left: 16),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(createFadeRoute(search_screen()));
                            },
                            child: Container(
                              width: 284.w,
                              height: 36.h,
                              padding: EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
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
                                    width: 236.w,
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

                          SizedBox(width: 8.w),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(createSlideUpRoute(Filter())); // 아래에서 위로 올라오는 애니메이션 사용
                            },
                            child: Container(
                              width: 36.w,
                              height: 36.h,
                              padding: EdgeInsets.all(6),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.filter_list, // 필터 아이콘
                                  size: 24, // 아이콘 크기
                                  color: Colors.white, // 아이콘 색상 (원하는 색상으로 변경 가능)
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                  // 카테고리
                  Container(
                    width: 360.w,
                    height: 44.h,
                    color: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: filterProvider.selectedFilters.isEmpty
                          ? const Text(
                        "선택된 필터가 없습니다.",
                        style: TextStyle(color: Colors.white),
                      )
                          : ListView(
                        scrollDirection: Axis.horizontal,
                        children: filterProvider.selectedFilters.map((filter) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Chip(
                              label: Text(filter),
                              backgroundColor: const Color(0xFF242424),
                              labelStyle: const TextStyle(color: Colors.white),
                              deleteIcon: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                              onDeleted: () {
                                filterProvider.toggleFilter(filter);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //네이버 지도 부분
                  Consumer<MapProvider>(
                    builder: (context, mapProvider, child) {
                      return Expanded(
                        child: Stack(
                          children: [
                            // 네이버 지도
                            NaverMap(
                              onMapReady: (controller) {
                                final mapProvider = Provider.of<MapProvider>(context, listen: false);
                                mapProvider.setMapController(controller);
                                _mapController = controller;
                                _updateMarkers(dataProvider, context);
                              },
                              // 카메라 이동 이벤트 (사용자 제스처 시 버튼 표시)
                              onCameraChange: (NCameraUpdateReason reason, bool animated) {
                                if (reason == NCameraUpdateReason.gesture) {
                                  if (!_showRefreshButton) {
                                    setState(() {
                                      _showRefreshButton = true;
                                    });
                                  }
                                }
                              },
                              options: NaverMapViewOptions(
                                initialCameraPosition: NCameraPosition(
                                  target: NLatLng(36.1234229, 128.1146402),
                                  zoom: 15,
                                  bearing: 0,
                                  tilt: 0,
                                ),
                                logoAlign: NLogoAlign.rightTop,
                                logoMargin: EdgeInsets.only(top: 16, right: 16),
                              ),
                            ),





                            Positioned(
                              bottom: 24,
                              left: 16,
                              child: GestureDetector(
                                onTap: _moveToCurrentLocation,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Icon(Icons.my_location,
                                      color: Colors.black),
                                ),
                              ),
                            ),

                            if (_showRefreshButton)
                              Positioned(
                                top: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      // 🔹 버튼을 누르면 false로 설정하여 숨김
                                      setState(() {
                                        _showRefreshButton = false;
                                      });

                                      if (mounted) {
                                        setState(() {}); // UI 갱신 강제 적용
                                      }
                                      await Future.delayed(Duration(milliseconds: 100));
                                      // 현재 지도 화면 기준으로 마커 업데이트
                                      _updateMarkers(dataProvider, context);
                                    },
                                    child: Container(
                                      width: 141.w,
                                      height: 36.h,
                                      padding: EdgeInsets.only(left: 12, right: 16, top: 8, bottom: 8),
                                      decoration: ShapeDecoration(
                                        color: Color(0xB2242424),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0A000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20.w,
                                            height: 20.h,
                                            child: Center(
                                              child: Icon(
                                                Icons.refresh,
                                                color: Color(0xFF05FFF7),
                                                size: 20.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            width: 89.w,
                                            height: 20.h,
                                            child: Text(
                                              '현 지도에서 검색',
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
                                        ],
                                      ),
                                    ),
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

  // 마커를 클릭했을떄 뜨는 스낵바
  void here(BuildContext context, String address, String roadAddress, String type, String title) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 360.w,
          height: 224.h, // 높이 설정
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
                  builder: (context) =>
                      StoreInfoScreen(
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
              height: 188.h,
              color: Color(0xFF1A1A1A),
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, bottom: 24.h),
              child: Column(
                children: [
                  Container(
                    width: 328.w,
                    height: 104.h,
                    child: Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          color: Colors.cyan,
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 216.w,
                          height: 104.h,
                          child: Column(
                            children: [
                              Container(
                                width: 216.w,
                                height: 48.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                                  crossAxisAlignment: CrossAxisAlignment.start, // 위쪽 정렬
                                  children: [
                                    Container(
                                      width: 188.w,
                                      height: 48.h,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 188.w,
                                            height: 20.h,
                                            child: Text(
                                              '$type',
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
                                          Container(
                                            width: 188.w,
                                            height: 28.h,
                                            child: Text(
                                              '$title',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w600,
                                                height: 1.30.h,
                                                letterSpacing: -0.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 28.w,
                                      height: 28.h,
                                      padding: EdgeInsets.all(2),
                                      child: IconButton(
                                        padding: EdgeInsets.zero, // 패딩을 없애서 아이콘 크기를 유지
                                        onPressed: () {
                                          print("qwe");
                                        },
                                        icon: Icon(
                                          Icons.favorite_outline, // 하트 아이콘
                                          color: Colors.white, // 아이콘 색상
                                          size: 24.sp, // 아이콘 크기
                                        ),
                                      ),
                                    ),

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
                                    fontSize: 14.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.40.h,
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
                                    fontSize: 14.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
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
                                          fontSize: 14.sp,
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
                                          fontSize: 14.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 1.40.h,
                                          letterSpacing: -0.35,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '을 선호하는 분들',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          height: 1.40.h,
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
                                fontSize: 12.sp,
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
          ),
            ],
          ),
        );
      },
    );
  }

// 위젯의 상태로 선택된 마커 title을 관리 (예: StatefulWidget)
  String? _selectedMarkerTitle;

  Set<NAddableOverlay> _buildMarkersFromList(List<dynamic> dataList) {
    return dataList.map<NAddableOverlay>((item) {
      final double latitude = double.tryParse(item['mapy'].toString()) ?? 0;
      final double longitude = double.tryParse(item['mapx'].toString()) ?? 0;
      final String title = item['title'].toString();
      final String address = item['address']?.toString() ?? '주소 없음';
      final String roadAddress = item['roadAddress']?.toString() ?? '도로명 주소 없음';
      final String type = item['type']?.toString() ?? '종류 없음';

      // 선택된 마커면 on 이미지, 아니면 off 이미지 사용
      final String iconPath = (title == _selectedMarkerTitle)
          ? 'assets/image/maker_on.png'
          : 'assets/image/marker_off.png';

      final marker = NMarker(
        id: title,
        position: NLatLng(latitude, longitude),
        caption: NOverlayCaption(text: address),
        icon: NOverlayImage.fromAssetImage(iconPath),
        size: const Size(40, 40),
      );

      marker.setOnTapListener((overlay) {
        // 선택된 마커 업데이트
        setState(() {
          _selectedMarkerTitle = title;
        });
        // 여기서 BuildContext를 사용해 DataProvider 가져오기
        final dataProvider = Provider.of<DataProvider>(context, listen: false);
        _updateMarkers(dataProvider, context);

        // 기존 동작 그대로
        here(context, address, roadAddress, type, title);
      });

      return marker;
    }).toSet();
  }



// 데이터 변경 시 마커 업데이트
  Future<void> _updateMarkers(DataProvider dataProvider, BuildContext context) async {
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

      if (newMarkers.isEmpty) {
        // 마커가 없을 경우 스낵바 표시
        _showCenteredSnackbar(context, "검색된 마커가 없습니다.");
      } else {
        _mapController!.addOverlayAll(newMarkers);
      }
    } catch (e) {
      print("마커 업데이트 중 오류 발생: $e");
    }
  }

  // 지도 새로고침시 마커가없을때 뜨는 스낵바
  void _showCenteredSnackbar(BuildContext context, String message) {
    OverlayEntry? overlayEntry;

    // 투명도 상태를 관리할 변수
    double opacity = 1.0;

    // OverlayEntry 생성
    overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: AnimatedOpacity(
          opacity: opacity, // 투명도 값
          duration: Duration(milliseconds: 500), // 애니메이션 지속 시간
          child: Material(
            child: Container(
              width: 328.w,
              height: 64.h,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: Color(0xB2242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 40.h,
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      child: Icon(
                        Icons.search, // 검색 아이콘
                        size: 24, // 아이콘 크기
                        color: Color(0xFF05FFF7), // 아이콘 색상
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 264.w,
                    height: 40.h,
                    child: Text(
                      '현재 지도에는 조건에 맞는 매장이 없어요\n지도 범위를 다시 설정해주세요',
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
          ),
        ),
      ),
    );

    // Overlay에 추가
    Overlay.of(context)?.insert(overlayEntry);

    // 일정 시간 후 투명도 변경 및 Overlay 제거
    Future.delayed(const Duration(milliseconds: 1000), () async {
      // 투명도를 0으로 변경하여 사라지는 애니메이션 적용
      opacity = 0.0;
      overlayEntry?.markNeedsBuild(); // 상태 업데이트

      // 애니메이션 완료 후 Overlay 제거
      await Future.delayed(const Duration(milliseconds: 1000)); // 애니메이션 지속 시간과 동일하게 설정
      overlayEntry?.remove();
    });
  }
}
