import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'Agree_screen.dart';
import 'login_screen.dart';
import 'main.dart';
import 'screen_setting.dart';

import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'SettingState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  // 네이버 지도 초기화
  await NaverMapSdk.instance.initialize(
    clientId: 'uswn3r8t9u',
    onAuthFailed: (ex) {
      print("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  // Supabase 초기화
  await Supabase.initialize(
    url: 'https://1.supabase.co',
    anonKey: '1',

  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NaverMapProvider()), /// 네이버 지도 상태
        ChangeNotifierProvider(create: (context) => SettingState()), /// 바텀바 상태
        ChangeNotifierProvider(create: (context) => DataProvider()), /// 매장정보 데이터베이스 불러오기
        ChangeNotifierProvider(create: (_) => MapProvider()),  /// 검색 상태
        ChangeNotifierProvider(create: (_) => AuthProvider()), /// 로그인 상태 추가
        ChangeNotifierProvider(create: (_) => UserInfoProvider()), ///유저 데이터베이스 불러오기
        ChangeNotifierProvider(create: (_) => FilterProvider()), ///필터 상태
      ],
      child: MyApp(),
    ),
  ); // 앱 실행
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); // 디자인 사이즈 기준

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          home: authProvider.isLoggedIn ? Home_screen() : login_total_screen(),
          // 로그인 여부에 따라 화면 전환
          navigatorObservers: [AuthObserver()], // AuthObserver 추가
        );
      },
    );
  }
}

class login_total_screen extends StatefulWidget {
  @override
  _login_totalscreen createState() => _login_totalscreen();
}

class _login_totalscreen extends State<login_total_screen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); //디자인 사이즈기준
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              HomeScreenAppBar(),
              Container(
                width: 360.w,
                height: 478.h,
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 254.h, bottom: 48.h),
                child: Column(
                  children: [
                    CustomInkWell(
                      context: context, // 현재 context를 전달
                      imagePath: 'assets/image/goole_icon.svg',
                      targetScreen: login_screen(), // LoginScreen으로 이동
                    ),
                    SizedBox(height: 16.h),
                    CustomInkWell(
                      context: context, // 현재 context를 전달
                      imagePath: 'assets/image/kakaoh_icon.svg',
                      targetScreen: login_screen(), // LoginScreen으로 이동
                    ),
                    SizedBox(height: 16.h),
                    CustomInkWell(
                      context: context, // 현재 context를 전달
                      imagePath: 'assets/image/modir_logo_icon.svg',
                      targetScreen: login_screen(), // LoginScreen으로 이동
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 360.w,
                height: 20.h,
                child: Text(
                  '아직 회원이 아니예요',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.40.h,
                    letterSpacing: -0.35,
                  ),
                ),
              ),
              Container(
                width: 360.w,
                height: 32.h,
                child: Column(
                  children: [
                    Container(
                      width: 73.w,
                      height: 32.h,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AgreePage()), // LoginScreen으로 이동
                          );
                        },
                        child: Text(
                          '회원가입',
                          textAlign: TextAlign.center,
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
            ]),
          ),
        ),
      ),
    );
  }
}
