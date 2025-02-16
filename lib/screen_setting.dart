import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

//반응형을 위한 디자인 툴
void initScreenUtil(BuildContext context) {
  ScreenUtil.init(
    context,
    designSize: Size(360, 740), // 디자인 기준 사이즈를 360으로 설정
    minTextAdapt: true,
    splitScreenMode: true,
  );
}

// 하단바 관리 툴_KeepAlive를 위한 래퍼 위젯 (사용시 메모리에 계속 유지)
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

//홈화면_검색기능


//홈화면_아이콘
Widget menuButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed, // 클릭 시 수행할 동작
    child: Container(
      width: 56.w,
      // 원하는 너비
      height: 56.h,
      // 원하는 높이
      padding: EdgeInsets.all(16.0),
      // 패딩
      decoration: BoxDecoration(
        color: Colors.transparent, // 배경색을 투명으로 설정
        borderRadius: BorderRadius.circular(8), // 모서리를 둥글게
      ),
      child: Icon(
        icon, // 외부에서 전달된 아이콘
        size: 24.sp, // 아이콘 크기
        color: Colors.white, // 아이콘 색상
      ),
    ),
  );
}

//홈화면_상단바
Widget buildAppBar() {
  return Container(
    width: 360.w,
    height: 56.h,
    color: Color(0xFF1A1A1A),
    child: Row(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          padding: EdgeInsets.all(16),
          child: Icon(
            Icons.menu, // 메뉴 아이콘
            color: Colors.white, // 아이콘 색상
            size: 24.sp, // 아이콘 크기
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 232.h,
          height: 56.h,
          padding: EdgeInsets.only(bottom: 18.h, top: 18.h),
          child: Container(
            width: 100.w,
            height: 20.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/image/logo_primary.svg', // SVG 파일 경로로 수정
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(width: 8.w),
        Container(
          width: 56.w,
          height: 56.h,
          padding: EdgeInsets.all(16),
          child: Icon(
            Icons.notifications_sharp, // 메뉴 아이콘
            color: Colors.white, // 아이콘 색상
            size: 24.sp, // 아이콘 크기
          ),
        ),
      ],
    ),
  );
}

//전체_뒤로가기 상단바
Widget CustomAppBar({required String title, required BuildContext context}) {
  return Container(
    width: 360.w,
    height: 56.h,
    color: Color(0xFF1A1A1A),
    padding: EdgeInsets.only(right: 16.w),
    child: Row(
      children: [
        // 뒤로가기 버튼
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // context를 이제 사용할 수 있음
          },
          child: Container(
            width: 56.w,
            height: 56.h,
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.chevron_left,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 280.w,
          height: 56.h,
          padding: EdgeInsets.only(bottom: 14.h, top: 14.h),
          child: Text(
            title, // 전달받은 텍스트 사용
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.40,
              letterSpacing: -0.50,
            ),
          ),
        ),
      ],
    ),
  );
}

//로그인화면_뒤로가기_상단바
Widget CustomloginAppBar(
    {required String title, required BuildContext context}) {
  return Container(
    width: 360.w,
    height: 56.h,
    color: Color(0xFF1A1A1A),
    child: Row(
      children: [
        // 뒤로가기 버튼
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // context를 이제 사용할 수 있음
          },
          child: Container(
            width: 56.w,
            height: 56.h,
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.chevron_left,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 248.w,
          height: 56.h,
          padding: EdgeInsets.only(bottom: 14.h, top: 14.h),
          child: Text(
            title, // 전달받은 텍스트 사용
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.40,
              letterSpacing: -0.50,
            ),
          ),
        ),
        Container(
          width: 56.w,
          height: 56.h,
          padding: EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 20),
          child: Container(
            width: 28.w,
            height: 16.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/logo_primary2.png'),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//회원가입_설명_text
Widget Signuptext(String title, String subtitle) {
  return Container(
    width: 360.w, // 360.w
    height: 148.h, // 148.h
    padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 48),
    child: Column(
      children: [
        Container(
          width: 328.w, // 328.w
          height: 28.h, // 28.h
          child: Text(
            title, // 전달받은 title 사용
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              // 20.sp
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.40.h,
              // 1.40.h
              letterSpacing: -0.50,
            ),
          ),
        ),
        SizedBox(height: 8.h), // 8.h
        Container(
          width: 328.w,
          height: 16.h, // 16.h
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.3.h,
              // 1.30.h
              letterSpacing: -0.30,
            ),
          ),
        ),
      ],
    ),
  );
}

//회원가입_하단바_버튼
class LoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: 100.h,
        padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
        child: InkWell(
          onTap: onTap, // 전달받은 onTap 사용
          child: Container(
            width: 328.w,
            // 328.w
            height: 52.h,
            // 52.h
            decoration: ShapeDecoration(
              color: Color(0xFF05FFF7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Text(
              buttonText, // 전달받은 로그인 텍스트 사용
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 20.sp,
                // 20.sp
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.40.h,
                // 1.40.h
                letterSpacing: -0.50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//회원가입_서브텍스트
Widget Subtext(String nickname) {
  return Container(
    width: 360.w, // 360.w
    height: 20.h, // 20.h
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Container(
      width: 328.w, // 328.w
      height: 20.h, // 20.h
      child: Text(
        nickname, // 전달받은 닉네임 텍스트 사용
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          // 14.sp
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          height: 1.40.h,
          // 1.40.h
          letterSpacing: -0.35,
        ),
      ),
    ),
  );
}
