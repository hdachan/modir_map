import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'information_screen.dart';
import 'screen_setting.dart'; // 정보 입력 화면 import

class Reservation extends StatefulWidget {

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<Reservation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:LoginButton(
        buttonText: '다음', // 로그인 텍스트 전달
        onTap:  () => print("qwe"),
      ),
    );
  }
}
