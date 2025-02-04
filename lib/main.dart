import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/naver_map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'SettingState.dart';
import 'home_screen.dart';
import 'search.dart';
import 'supabase_setting.dart';

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
    url: 'https://ceckhzfboykmsshamikv.supabase.co',
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
    ScreenUtil.init(
      context,
      designSize: Size(360, 740), // 디자인 기준 사이즈를 360으로 설정
      minTextAdapt: true,
      splitScreenMode: true,
    );
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
                KeepAlivePage(child: NaverMapBackground()), // 지도 탭 (상태 유지)
                Center(child: Text("탭 2")), // 탭 5
                Setting(),
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
              backgroundColor: Color(0xFF1A1A1A), // 배경색을 검정색으로 설정
              selectedItemColor: Color(0xFFBFACF9), // 선택된 아이템 색상
              unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: '지도'),
                BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: '코디'),
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.live_tv_outlined), label: '라이브'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이'),
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