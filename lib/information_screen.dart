import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screen_setting.dart';

class information_screen extends StatefulWidget {
  @override
  _information_screen createState() => _information_screen();
}

class _information_screen extends State<information_screen> {
  bool _isTextFieldEmpty = true;
  bool _isTextFieldEmpty1 = true;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  int _selectedIndex = 0; // 선택된 버튼의 인덱스

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index; // 버튼 클릭 시 인덱스 업데이트
    });
  }

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _nicknameController.text.isEmpty;
      });
    });
    _birthdateController.addListener(() {
      setState(() {
        _isTextFieldEmpty1 = _birthdateController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context); // 디자인 사이즈 기준
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomAppBar(title: '정보 입력', context: context),

                //정보입력 텍스트
                Container(
                  width: 360.w,
                  height: 148.h,
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 48),
                  child: Column(
                    children: [
                      Container(
                        width: 328.w,
                        height: 28.h,
                        child: Text(
                          '정보입력',
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
                      SizedBox(height: 8.h),
                      Container(
                        width: 328.w,
                        height: 16.h,
                        child: Text(
                          '활동하실 닉네임과 정보들을 입력해 주세요',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.30.h,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //닉네임
                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '닉네임',
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
                SizedBox(height: 8.h),

                //닉네임 필드
                Container(
                  width: 360.w,
                  height: 64.h,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Container(
                    width: 328.w,
                    height: 56.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Color(0xFF242424),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nicknameController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.40.h,
                              letterSpacing: -0.35,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '모디랑',
                              hintStyle: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.40.h,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        if (!_isTextFieldEmpty)
                          IconButton(
                            icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                            onPressed: () {
                              _nicknameController.clear();
                              setState(() {
                                _isTextFieldEmpty = true;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                // 오류 문자
                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '닉네임은 한영문자 포함 특수문자 _만 사용가능합니다',
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
                SizedBox(height: 48.h),

                //생년월일
                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '생년월일',
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
                SizedBox(height: 8.h),
                //텍스트 필드
                Container(
                  width: 360.w,
                  height: 64.h,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Container(
                    width: 328.w,
                    height: 56.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Color(0xFF242424),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _birthdateController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.40.h,
                              letterSpacing: -0.35,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '모디랑',
                              hintStyle: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.40.h,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        if (!_isTextFieldEmpty1)
                          IconButton(
                            icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                            onPressed: () {
                              _birthdateController.clear();
                              setState(() {
                                _isTextFieldEmpty1 = true;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 48.h),

                Container(
                  width: 360.w,
                  height: 20.h,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 328.w,
                    height: 20.h,
                    child: Text(
                      '성별',
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
                SizedBox(height: 4.h),
                //성별_버튼
                Container(
                  width: 328.w,
                  height: 48.h,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => _onButtonPressed(0),
                        child: Container(
                          width: 156.w,
                          height: 48.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                color: _selectedIndex == 0
                                    ? Color(0xFF05FFF7)
                                    : Color(0xFF888888),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '남자',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Color(0xFF05FFF7)
                                    : Color(0xFF888888),
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.h,
                                letterSpacing: -0.40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      InkWell(
                        onTap: () => _onButtonPressed(1),
                        child: Container(
                          width: 156.w,
                          height: 48.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                color: _selectedIndex == 1
                                    ? Color(0xFF05FFF7)
                                    : Color(0xFF888888),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '여자',
                              style: TextStyle(
                                color: _selectedIndex == 1
                                    ? Color(0xFF05FFF7)
                                    : Color(0xFF888888),
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.h,
                                letterSpacing: -0.40,
                              ),
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: 100.h,
          padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
          child: InkWell(
            onTap: () {
              print("버튼누름");
            },
            child: Container(
              width: 328.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: Color(0xFF05FFF7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              padding:
              EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              child: Text(
                '로그인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 20.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.40.h,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
