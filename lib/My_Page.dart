import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  runApp(MaterialApp(
    home: MY_page(),
  ));
}

class MY_page extends StatefulWidget {
  @override
  _MY_pageState createState() => _MY_pageState();
}

class _MY_pageState extends State<MY_page> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // 상단바
                Container(
                  width: 360.w,
                  height: 56.h,
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  child: Row(
                    children: [
                      Container(
                          width: 224.w,
                          height: 56.h,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                width: 28.w,
                                height: 16.h,
                                child: Image.asset(
                                  'assets/image/logo_primary2.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                        onTap: () {
                          // 버튼 클릭 시 실행할 코드
                          print("알림 버튼 클릭됨");
                        },
                        child: Container(
                          width: 56.w,
                          height: 56.h,
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.notifications_outlined, // 종 아이콘
                            size: 24.sp, // 아이콘 크기
                            color: Colors.white, // 아이콘 색상
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 버튼 클릭 시 실행할 코드
                          print("설정 버튼 클릭됨");
                        },
                        child: Container(
                          width: 56.w,
                          height: 56.h,
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.settings_outlined, // 종 아이콘
                            size: 24.sp, // 아이콘 크기
                            color: Colors.white, // 아이콘 색상
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //마이페이지 수정
                Container(
                  width: 360.w,
                  height: 284.h,
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  child: Column(
                    children: [
                      Container(
                        width: 360.w,
                        height: 116.h,
                        padding: EdgeInsets.all(16),
                        child: Container(
                          width: 328.w,
                          height: 84.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.08),
                              end: Alignment(-1, 0.08),
                              colors: [Color(0xFF242424), Color(0x4C242424)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: Color(0xFF242424)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 20,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 12, bottom: 12),
                          child: Row(
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFF0000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                width: 228.w,
                                height: 56.h,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 228.w,
                                      height: 28.h,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 172.w,
                                            height: 20.h,
                                            child: Text(
                                              'NA_왔오',
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
                                          SizedBox(width: 8.w),
                                          Container(
                                            width: 48.w,
                                            height: 28.h,
                                            padding: EdgeInsets.only(left: 12,right: 12,top: 4,bottom: 4),
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1.w,
                                                    color: Color(0xFF05FFF7)),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '수정',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.40.h,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      width: 228.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 24.h,
                                            child: Text(
                                              '남성',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40.h,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            width: 4.w,
                                            height: 20.h,
                                            child: Text(
                                              '·',
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            height: 20.h,
                                            child: Text(
                                              '177cm',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40.h,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            width: 4.w,
                                            height: 20.h,
                                            child: Text(
                                              '·',
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            height: 20.h,
                                            child: Center(
                                              child: Text(
                                                '70kg',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.40.h,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360.w,
                        height: 120.h,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              width: 328.w,
                              height: 20.h,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '현재 ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '스트릿 기반의 비즈니스 캐주얼',
                                      style: TextStyle(
                                        color: Color(0xFF05FFF7),
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '을 선호해요',
                                      style: TextStyle(
                                        color: Color(0xFFF6F6F6),
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: 328.w,
                              height: 52.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF05FFF7),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 268.w,
                                    height: 20.h,
                                    child: Text(
                                      '내 패션 DNA 조사',
                                      style: TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    child: Center( // 아이콘을 중앙에 배치하기 위해 Center 위젯 사용
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined, // 화살표 아이콘
                                        size: 20.sp, // 아이콘 크기
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //활동 텍스트
                middleText('활동'),

                // 현재 올린 코디가 없어요
                Container(
                    width: 360.w,
                    height: 228.h,
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
                    child: Container(
                      width: 328.w,
                      height: 180.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF242424),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                        children: [
                          Container(
                            width: 127.w,
                            height: 20.h,
                            child: Text(
                              '현재 올린 코디가 없어요',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.40.h,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 170.w,
                            height: 17.h,
                            child: Text(
                              '자신이 생각한 스타일을 공유해보세요',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.40.h,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: 360.w,
                  height: 84.h,
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: 328.w,
                    height: 52.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.08),
                        end: Alignment(-1, 0.08),
                        colors: [Color(0xFF242424), Color(0x4C242424)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF242424)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Text(
                      '코디 올리러 가기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF05FFF7),
                        fontSize: 14.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.40.h,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                middleText('기록'),
                customButton(
                  '최근에 본 매장',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '최근에 본 코디',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '최근에 본 라이브',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '이벤트 참여 내역',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                middleText('관심'),
                customButton(
                  '관심 매장',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '관심 코디',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '관심 라이브',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                middleText('댓글'),
                customButton(
                  '댓글단 코디',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                middleText('문의'),
                customButton(
                  '매장에 문의한 글',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                middleText('센터'),
                customButton(
                  '공지사항',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  'FQA',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                customButton(
                  '1:1 문의하기',
                  () {
                    // 버튼 클릭 시 수행할 작업을 여기에 작성하세요.
                    print('버튼22이 클릭되었습니다!');
                  },
                ),
                CompanyInfo(),
              ],
            ),
          ),
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
      height: 28.h,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
          height: 1.40.h,
          letterSpacing: -0.50,
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
