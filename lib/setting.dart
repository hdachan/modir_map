import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/test.dart';

import 'SettingState.dart';
import 'screen_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  runApp(MaterialApp(
    home: setting(),
  ));
}

class setting extends StatefulWidget {
  @override
  _setting createState() => _setting();
}

class _setting extends State<setting> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: Consumer<UserInfoProvider>(
          builder: (context, userInfoProvider, child) {
            final user = userInfoProvider.userList[0];

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    CustomAppBar(title: '환경설정', context: context),
                    middleText('알림설정'),
                    customButton(
                      '모디랑에서 보내는 공지',
                          () {
                        // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                        print('버튼이 클릭되었습니다!');
                      },
                    ),
                    customButton(
                      '코디 댓글 알림',
                          () {
                        // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                        print('버튼이 클릭되었습니다!');
                      },
                    ),
                    customButton(
                      '야간 푸시 알림 (22:00~08:00)',
                          () {
                        // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                        print('버튼이 클릭되었습니다!');
                      },
                    ),
                    middleText('기타'),
                    customButton(
                      '오류신고',
                          () {
                        // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                        print('버튼이 클릭되었습니다!');
                      },
                    ),
                    customButton(
                      '로그아웃',
                          () {
                        // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                        print('버튼이 클릭되었습니다!');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


Widget middleText(String text) {
  return Container(
    width: 360.w,
    height: 60.h,
    padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
    child: Container(
      width: 328.w,
      height: 20.h,
      child: Text(
        text,
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
  );
}

Widget customButton(String title, VoidCallback onPressed) {
  return Container(
    width: 360.w,
    height: 48.h,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // 패딩을 0으로 설정하여 Container와 동일한 크기로 만듭니다.
        backgroundColor: Colors.transparent, // 배경색을 투명으로 설정
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // 모서리를 둥글게 하지 않음
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 312.w,
            height: 48.h,
            padding: EdgeInsets.only(left: 16, top: 14, bottom: 14),
            child: Text(
              title, // 전달받은 텍스트 사용
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
            width: 48.w,
            height: 48.h,
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.arrow_forward_ios_sharp, // 오른쪽 화살표 아이콘
              color: Colors.white, // 아이콘 색상
              size: 16.sp, // 아이콘 크기
            ),
          ),
        ],
      ),
    ),
  );
}

Widget CompanyInfo() {
  return Container(
    width: 360.w,
    padding: const EdgeInsets.only(
      top: 24,
      left: 16,
      right: 16,
      bottom: 48,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 28.w,
              height: 16.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/logo_primary2.png'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(width: 4),
            Text(
              '(주)모디랑',
              style: TextStyle(
                color: Color(0xFF3D3D3D),
                fontSize: 12.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 1.3.h,
                letterSpacing: -0.30,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          width: 328.w,
          height: 178.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xFFE7E7E7), width: 1.w)),
          child: Column(
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '대표이사  :  황대찬  |  사업자등록번호  :  비공개',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '주소  :  경북 경산시 하양읍 문화로4길 18-15 샹그릴라A 306호',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '전화번호  :  010-3009-5596',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '이메일 주소  :  holyhabits915@gmail.com',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '호스팅서비스제공자  : Firebase Hosting - Google  ',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '통신판매업신고  :  2024-대구경북-00336호',
                  style: TextStyle(
                    color: Color(0xFF5D5D5D),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "사업자정보확인",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: 1.w,
              height: 11.h,
              decoration: BoxDecoration(color: Color(0xFF5D5D5D)),
            ),
            SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "전자금융거래이용약관",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: 1.w,
              height: 11.h,
              decoration: BoxDecoration(color: Color(0xFF5D5D5D)),
            ),
            SizedBox(width: 4.w),
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "전자금융거래이용약관",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5114FF),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "리뷰운영정책",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: 1.w,
              height: 11.h,
              decoration: BoxDecoration(color: Color(0xFF5D5D5D)),
            ),
            SizedBox(width: 4.w),
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "데이터제공정책",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Container(
              width: 1,
              height: 11,
              decoration: BoxDecoration(color: Color(0xFF5D5D5D)),
            ),
            SizedBox(width: 4.w),
            TextButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Text(
                "소비자분쟁해결기준",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.28,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 164.w,
              height: 84.h,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      topLeft: Radius.circular(4)),
                  border: Border.all(color: Color(0xFFE7E7E7), width: 1)),
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '고객센터(대표)',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '010-3009-5596',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '24시간 운영, 연중무휴',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 164.w,
              height: 84.h,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  border: Border(
                      top: BorderSide(color: Color(0xFFE7E7E7), width: 1),
                      bottom: BorderSide(color: Color(0xFFE7E7E7), width: 1),
                      right: BorderSide(color: Color(0xFFE7E7E7), width: 1))),
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '고객센터',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '010-4172-4515',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '오전 09:00 ~ 익일 18:00',
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '(주)모디랑은 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 \n상품정보 및 거래 등에 대해 책임을 지지 않습니다. \n단, (주)모디랑이 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.',
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 11,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.28,
            ),
          ),
        )
      ],
    ),
  );
}
