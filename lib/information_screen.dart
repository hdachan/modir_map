import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/screen_setting.dart';

class InformationScreen extends StatefulWidget {
  final String email;
  final String password;

  InformationScreen({required this.email, required this.password});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool _isTextFieldEmpty = true;
  bool _isTextFieldEmpty1 = true;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  int _selectedGenderIndex = -1; // 0: 남자, 1: 여자
  int _selectedCategoryIndex = -1; // 카테고리 선택

  void _onGenderButtonPressed(int index) {
    setState(() {
      _selectedGenderIndex = index;
    });
  }

  void _onCategoryButtonPressed(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  Future<void> _signUp() async {
    try {
      final supabase = Supabase.instance.client;

      // 입력값 검사
      if (_nicknameController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('닉네임을 입력해주세요.')),
        );
        return;
      }

      if (_birthdateController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('생년월일을 입력해주세요.')),
        );
        return;
      }

      if (_selectedGenderIndex == -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('성별을 선택해주세요.')),
        );
        return;
      }

      if (_selectedCategoryIndex == -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('카테고리를 선택해주세요.')),
        );
        return;
      }

      // 회원가입 요청
      final response = await supabase.auth.signUp(
        email: widget.email,
        password: widget.password,
      );

      if (response.user != null) {
        final userId = response.user!.id;
        final username = _nicknameController.text.trim();
        final birthdate = _birthdateController.text.trim();
        final gender = _selectedGenderIndex == 0 ? true : false; // 남자(true), 여자(false)
        final category = _selectedCategoryIndex == 0 ? '빈티지' : '아메카지';

        // userinfo 테이블에 데이터 저장
        await supabase.from('userinfo').upsert({
          'id': userId,
          'email': widget.email,
          'username': username,
          'birthdate': birthdate,
          'gender': gender,
          'category': category,
        });

        // 홈 화면 이동
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('회원가입 실패. 다시 시도해주세요.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
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
    initScreenUtil(context);
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomAppBar(title: '정보 입력', context: context),
                Signuptext('정보입력', '활동하실 닉네임과 정보들을 입력해 주세요'),

                // 닉네임 입력 필드
                Subtext('닉네임'),
                SizedBox(height: 8.h),
                _buildTextField(_nicknameController, '닉네임을 입력하세요'),

                SizedBox(height: 48.h),

                // 생년월일 입력 필드
                Subtext('생년월일'),
                SizedBox(height: 8.h),
                _buildTextField1(_birthdateController, 'YYYY-MM-DD'),

                SizedBox(height: 48.h),

                // 성별 선택 버튼
                Subtext('성별'),
                SizedBox(height: 8.h),
                _buildSelectionButtons(['남자', '여자'], _selectedGenderIndex, _onGenderButtonPressed),

                SizedBox(height: 48.h),

                // 카테고리 선택 버튼
                Subtext('카테고리'),
                SizedBox(height: 8.h),
                _buildSelectionButtons(['빈티지', '아메카지'], _selectedCategoryIndex, _onCategoryButtonPressed),

                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:LoginButton(
        buttonText: '완료', // 로그인 텍스트 전달
        onTap:  () => _signUp(),
      ),
    );
  }

  // 입력 필드 위젯
  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
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
                controller: controller,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xFF888888), fontSize: 14.sp),
                ),
              ),
            ),
            if (controller.text.isNotEmpty)
              IconButton(
                icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                onPressed: () {
                  controller.clear();
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }


  // 숫자입력 필드
  Widget _buildTextField1(TextEditingController controller, String hintText) {
    return Container(
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
                controller: controller,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                keyboardType: TextInputType.number, // 숫자 키보드 설정
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
                  LengthLimitingTextInputFormatter(8), // 최대 8자리 (YYYYMMDD)
                  BirthdateInputFormatter(), // 자동으로 YYYY-MM-DD 형식 적용
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xFF888888), fontSize: 14.sp),
                ),
                onChanged: (value) {
                  setState(() {}); // 입력값 변경 시 아이콘 갱신
                },
              ),
            ),
            if (controller.text.isNotEmpty)
              IconButton(
                icon: Icon(Icons.cancel, color: Color(0xFF888888)),
                onPressed: () {
                  controller.clear();
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
  // 버튼 선택 위젯 (성별, 카테고리 공용)
  Widget _buildSelectionButtons(List<String> labels, int selectedIndex, Function(int) onPressed) {
    return Container(
      width: 328.w,
      height: 48.h,
      child: Row(
        children: List.generate(labels.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? 16.w : 0),
            child: InkWell(
              onTap: () => onPressed(index),
              child: Container(
                width: 156.w,
                height: 48.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.w,
                      color: selectedIndex == index ? Color(0xFF05FFF7) : Color(0xFF888888),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: selectedIndex == index ? Color(0xFF05FFF7) : Color(0xFF888888),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// 생년월일 유효성검사
class BirthdateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), ''); // 숫자만 남기기
    String formattedText = '';

    if (digitsOnly.length > 4) {
      formattedText = '${digitsOnly.substring(0, 4)}-${digitsOnly.substring(4, digitsOnly.length > 6 ? 6 : digitsOnly.length)}';
    } else {
      formattedText = digitsOnly;
    }

    if (digitsOnly.length > 6) {
      formattedText += '-${digitsOnly.substring(6, digitsOnly.length > 8 ? 8 : digitsOnly.length)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}