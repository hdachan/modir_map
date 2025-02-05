import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapProvider with ChangeNotifier {
  NaverMapController? _mapController;

  NaverMapController? get mapController => _mapController;

  void setMapController(NaverMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void moveToLocation(double latitude, double longitude) async {
    if (_mapController != null) {
      final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
        target: NLatLng(latitude, longitude),
        zoom: 15, // 적절한 줌 레벨 설정
      );
      await _mapController!.updateCamera(cameraUpdate);
      print("카메라 이동 완료: $latitude, $longitude"); // 확인용 로그
      notifyListeners(); // ✅ UI 업데이트 추가
    } else {
      print("MapController가 아직 설정되지 않음!");
    }
  }

}
