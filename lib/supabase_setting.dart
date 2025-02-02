import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:provider/provider.dart';

import 'SettingState.dart';

class MyMapWidget extends StatefulWidget {
  @override
  _MyMapWidgetState createState() => _MyMapWidgetState();
}

class _MyMapWidgetState extends State<MyMapWidget> {
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

        return NaverMap(
          onMapReady: (controller) {
            _mapController = controller; // 컨트롤러 저장
            _updateMarkers(dataProvider); // 마커 업데이트
          },
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

      return NMarker(
        id: title,
        position: NLatLng(latitude, longitude),
        caption: NOverlayCaption(text: title), // 마커 캡션 추가
      );
    }).toSet(); // List -> Set 변환
  }

  // 데이터 변경 시 마커 업데이트
  void _updateMarkers(DataProvider dataProvider) {
    if (_mapController == null) return;

    final newMarkers = _buildMarkers(dataProvider);
    _mapController!.clearOverlays(); // 기존 마커 삭제
    _mapController!.addOverlayAll(newMarkers); // 새로운 마커 추가
  }
}
