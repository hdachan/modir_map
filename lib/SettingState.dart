import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabase = Supabase.instance.client; // Supabase 클라이언트 인스턴스
List<dynamic> dataList = [];


//하단바 상태관리
class SettingState extends ChangeNotifier {

  // 현재 선택된 하단바 인덱스
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // 하단바 인덱스 변경 메서드
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

//네이버 지도 상태관리
class NaverMapProvider with ChangeNotifier {
  // 상태 관리에 필요한 변수와 메서드 정의
}




// modir supabase 실시간 불러오기
class DataProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;
  List<dynamic> dataList = [];
  bool isLoading = false; // 로딩 상태 추가
  String? errorMessage; // 에러 메시지 추가
  late RealtimeChannel _realtimeChannel;

  // 생성자에서 실시간 구독 설정
  DataProvider() {
    setupRealtimeSubscription();
  }

  // 데이터 불러오기
  Future<void> fetchData() async {
    isLoading = true; // 로딩 시작
    errorMessage = null; // 에러 메시지 초기화
    notifyListeners(); // 상태 변경 알림

    try {
      final response = await supabase
          .from('modir')
          .select()
          .catchError((error) {
        print('Error fetching data: $error');
        errorMessage = error.toString(); // 에러 메시지 저장
        return null;
      });

      if (response != null) {
        dataList = response;
      }
    } catch (e) {
      print('Error: $e');
      errorMessage = e.toString(); // 에러 메시지 저장
    } finally {
      isLoading = false; // 로딩 종료
      notifyListeners(); // 상태 변경 알림
    }
  }

  // 실시간 구독 설정 (Supabase 최신 방식)
  void setupRealtimeSubscription() {
    _realtimeChannel = supabase.channel('modir_channel').onPostgresChanges(
      event: PostgresChangeEvent.all, // 모든 변경 감지
      schema: 'public',
      table: 'modir',
      callback: (payload) {
        fetchData(); // 변경 발생 시 데이터 갱신
      },
    ).subscribe();
  }

  // 리소스 정리
  void disposeProvider() {
    _realtimeChannel.unsubscribe();
  }

  // Provider가 dispose될 때 호출
  @override
  void dispose() {
    disposeProvider();
    super.dispose();
  }
}


// marker supabase 실시간 불러오기
class DataProvider2 with ChangeNotifier {
  final supabase = Supabase.instance.client;
  List<dynamic> storeMarkerList = [];
  bool isLoading = false; // 로딩 상태 추가
  String? errorMessage; // 에러 메시지 추가

  // 매장 및 마커 데이터 불러오기
  Future<List<Map<String, dynamic>>?> fetchStoreAndMarkerData() async {
    isLoading = true; // 로딩 시작
    errorMessage = null; // 에러 메시지 초기화
    notifyListeners(); // 상태 변경 알림

    try {
      final response = await supabase
          .from('markers')
          .select('''
            mapx,
            mapy,
            stores (name, type, address, road_address)
          ''')
          .catchError((error) {
        print('Error fetching data: $error');
        errorMessage = error.toString(); // 에러 메시지 저장
        return null;
      });

      if (response != null) {
        storeMarkerList = response;
        return List<Map<String, dynamic>>.from(response);
      }
    } catch (e) {
      print('Error: $e');
      errorMessage = e.toString(); // 에러 메시지 저장
    } finally {
      isLoading = false; // 로딩 종료
      notifyListeners(); // 상태 변경 알림
    }
    return null;
  }
}

// 지도 이동 프로바이더
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




