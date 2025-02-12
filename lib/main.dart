import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/animation.dart';

import 'My_Page.dart';
import 'SettingState.dart';
import 'home_screen.dart';
import 'logout.dart';
import 'naver_map.dart';
import 'screen_setting.dart';
import 'test.dart';


class Home_screen extends StatelessWidget {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); //디자인 사이즈기준
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
                //KeepAlivePage(child:NaverMapBackground()),
                Logout_screen(),
                Setting(),
                LoginPage(),
                MY_page(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: settingState.selectedIndex,
              onTap: (index) {
                settingState.updateIndex(index); // 하단바 인덱스 업데이트
                _pageController.jumpToPage(index); // 페이지 전환
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFF1A1A1A),
              selectedItemColor: Color(0xFFBFACF9), // 선택된 아이템 색상
              unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: '지도'),
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

