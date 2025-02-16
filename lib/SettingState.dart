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


// userinfo supabase 실시간 불러오기
class UserInfoProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;
  List<dynamic> userList = [];
  bool isLoading = false;
  String? errorMessage;
  late RealtimeChannel _realtimeChannel;

  UserInfoProvider() {
    setupRealtimeSubscription();
    // 앱 시작 시 데이터를 불러옵니다.
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        errorMessage = "로그인된 사용자가 없습니다.";
        userList = [];
        return;
      }

      // 쿼리 실행 시 에러 발생 시 예외가 throw됩니다.
      final response = await supabase
          .from('userinfo')
          .select()
          .eq('id', currentUser.id);

      // 정상적으로 데이터를 반환하면 response는 List<dynamic> 타입입니다.
      userList = response as List<dynamic>;
    } catch (e) {
      errorMessage = e.toString();
      userList = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // username을 업데이트하는 메서드
  Future<void> updateUsername(String newUsername) async {
    final currentUser = supabase.auth.currentUser;
    if (currentUser == null) {
      errorMessage = "로그인된 사용자가 없습니다.";
      notifyListeners();
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      final response = await supabase
          .from('userinfo')
          .update({'username': newUsername})
          .eq('id', currentUser.id);

      // 업데이트된 행이 있는지 확인 (예: response가 List 형태로 반환됨)
      if (response is List && response.isEmpty) {
        errorMessage = "업데이트된 행이 없습니다. RLS 정책이나 레코드 존재 여부를 확인하세요.";
      } else {
        // 업데이트 성공 시 최신 데이터를 다시 가져옵니다.
        await fetchUserInfo();
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  void setupRealtimeSubscription() {
    final currentUser = supabase.auth.currentUser;
    if (currentUser == null) return;

    _realtimeChannel = supabase.channel('userInfo_channel').onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'userinfo',
      filter: PostgresChangeFilter(
        type: PostgresChangeFilterType.eq,
        column: 'id',
        value: currentUser.id,
      ),
      callback: (payload) {
        fetchUserInfo();
      },
    ).subscribe();
  }

  void disposeProvider() {
    _realtimeChannel.unsubscribe();
  }

  @override
  void dispose() {
    disposeProvider();
    super.dispose();
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


// 로그인 로그아웃 상태관리
class AuthProvider with ChangeNotifier {
  Stream<AuthState>? _authStateStream;
  Session? _session;

  AuthProvider() {
    _session = Supabase.instance.client.auth.currentSession;
    _authStateStream = Supabase.instance.client.auth.onAuthStateChange;

    _authStateStream?.listen((data) {
      _session = data.session;
      notifyListeners(); // 로그인/로그아웃 상태 변경 감지
    });
  }

  Session? get session => _session;

  bool get isLoggedIn => _session != null;

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
    notifyListeners();
  }
}


// 로그인 로그아웃 상태관리
class AuthObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _checkAuthState();
    super.didPush(route, previousRoute);
  }

  void _checkAuthState() async {
    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      navigator?.pushReplacementNamed('/login');
    }
  }
}


// 필터 상태관리
class FilterProvider extends ChangeNotifier {
  final List<String> _selectedFilters = [];

  List<String> get selectedFilters => _selectedFilters;

  /// 필터 토글 (이미 선택되어 있으면 제거, 없으면 추가)
  void toggleFilter(String filter) {
    if (_selectedFilters.contains(filter)) {
      _selectedFilters.remove(filter);
    } else {
      _selectedFilters.add(filter);
    }
    notifyListeners();
  }

  /// 특정 필터 제거
  void removeFilter(String filter) {
    _selectedFilters.remove(filter);
    notifyListeners();
  }
}

