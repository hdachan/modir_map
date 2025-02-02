import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:provider/provider.dart';
import 'package:untitled/naver_map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'SettingState.dart';
import 'search.dart';
import 'supabase_setting.dart';
import 'wndud123.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  // 네이버 지도 초기화
  await NaverMapSdk.instance.initialize(
    clientId: '1',
    onAuthFailed: (ex) {
      print("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  // Supabase 초기화
  await Supabase.initialize(
    url: '1',
    anonKey: '1',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NaverMapProvider()), // 네이버 지도 상태
        ChangeNotifierProvider(create: (context) => SettingState()), // 바텀바 상태
        ChangeNotifierProvider(create: (context) => DataProvider()), // 설정 상태
      ],
      child: MyApp(),
    ),
  ); // 앱 실행
}


class MyApp extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (context, settingState, child) {
        return MaterialApp(
          home: Scaffold(
            body: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // 스와이프 비활성화
              onPageChanged: (index) {
                settingState.updateIndex(index); // 페이지 변경 시 인덱스 업데이트
              },
              children: [
                NaverMapBackground(),
                //KeepAlivePage(child: NaverMapBackground()), // 지도 탭 (상태 유지)
                //TodoListScreen(),
                Center(child: Text("탭 2")), // 탭 5
                NaverLocalSearchPage(),
                MyMapWidget(),
                Center(child: Text("탭 5")), // 탭 5
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: settingState.selectedIndex,
              onTap: (index) {
                settingState.updateIndex(index); // 하단바 인덱스 업데이트
                _pageController.jumpToPage(index); // 페이지 전환
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
                BottomNavigationBarItem(icon: Icon(Icons.build), label: '코디'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: '라이브'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
              ],
            ),
          ),
        );
      },
    );
  }
}

// KeepAlive를 위한 래퍼 위젯
class KeepAlivePage extends StatefulWidget {
  final Widget child;

  const KeepAlivePage({required this.child});

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; // 메모리에 유지

  @override
  Widget build(BuildContext context) {
    super.build(context); // AutomaticKeepAliveClientMixin 필수
    return widget.child;
  }
}