import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
Widget customSearchButton(BuildContext context, VoidCallback onTap) {
  return Container(
    width: 360.w,
    height: 80.h,
    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
    decoration: BoxDecoration(color: Color(0xFF1A1A1A)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap, // 외부에서 지정한 onTap 이벤트 사용
          borderRadius: BorderRadius.circular(16), // 클릭 효과의 경계 반경 설정
          child: Container(
            width: 328.w,
            height: 48.h,
            padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 12.h, bottom: 12.h),
            decoration: ShapeDecoration(
              color: Color(0x19320E99),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: Color(0xFF4D17EE)),
                borderRadius: BorderRadius.circular(16.w),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  child: Icon(
                    Icons.search, // 검색 아이콘 추가
                    color: Colors.white, // 아이콘 색상
                    size: 24.sp, // 아이콘 크기
                  ),
                ),
                SizedBox(width: 4), // 간격 추가
                Container(
                  width: 122.w,
                  height: 24.h,
                  child: Center( // 텍스트를 중앙에 배치
                    child: Text(
                      '브랜드, 매장, 위치 검색',
                      style: TextStyle(
                        color: Color(0xFFD1D1D1),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.70,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


//홈화면_아이콘
Widget menuButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed, // 클릭 시 수행할 동작
    child: Container(
      width: 56.w, // 원하는 너비
      height: 56.h, // 원하는 높이
      padding: EdgeInsets.all(16.0), // 패딩
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
    height: 80.h,
    color: Color(0xFF1A1A1A),
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Row(
      children: [
        menuButton(
          icon: Icons.menu,
          onPressed: () {
            print("Menu button pressed");
          },
        ),
        SizedBox(width: 8.w),
        Container(
          width: 232.w,
          height: 20.h,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/image/logo_primary.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 8.w),
        menuButton(
          icon: Icons.notifications_sharp,
          onPressed: () {
            print("Notification button pressed");
          },
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
    padding: EdgeInsets.only(left: 8.w, right: 16.w),
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
