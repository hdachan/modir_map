import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/screen_setting.dart';
import 'Sign_Up.dart';
import 'package:url_launcher/url_launcher.dart';


class AgreePage extends StatefulWidget {
  const AgreePage({Key? key}) : super(key: key);

  @override
  _AgreePageState createState() => _AgreePageState();
}

class _AgreePageState extends State<AgreePage> {
  bool agreeToAllTerms = false; // 전체 동의
  bool agreeToRequiredTerms1 = false; // (필수) 약관 동의
  bool agreeToRequiredTerms2 = false; //(필수) 개인정보 수집 동의
  bool agreeToRequiredTerms3 = false; //(필수) 전금 금융 거래 이용 약관 동의
  bool agreeToSelectTerms = false; //(선택) 약관 동의
  bool isButtonPressed = false; //다음 버튼

  // 전체동의 처리 메서드
  void _toggleAgreement() {
    setState(() {
      agreeToAllTerms = !agreeToAllTerms;
      if (agreeToAllTerms) {
        agreeToRequiredTerms1 = true;
        agreeToRequiredTerms2 = true;
        agreeToRequiredTerms3 = true;
        agreeToSelectTerms = true;
        isButtonPressed = true;
      } else {
        agreeToRequiredTerms1 = false;
        agreeToRequiredTerms2 = false;
        agreeToRequiredTerms3 = false;
        agreeToSelectTerms = false;
        isButtonPressed = false;
      }
    });
  }

  //일정 조건이 참일때 버튼 활성화
  void _StatetoggleAgreement() {
    setState(() {
      bool allAgreed = agreeToRequiredTerms1 &&
          agreeToRequiredTerms2 &&
          agreeToRequiredTerms3;
      if (allAgreed) {
        isButtonPressed = true;
        agreeToAllTerms = true;
      } else {
        isButtonPressed = false;
        agreeToAllTerms = false;
      }
    });
  }

  // (필수) 약관 동의 메서드
  void _toggleTermsAgreement() {
    setState(() {
      agreeToRequiredTerms1 = !agreeToRequiredTerms1;
      _StatetoggleAgreement();
    });
  }
  //(필수) 개인정보 수집 동의 메서드
  void _toggleTermsAgreement1() {
    setState(() {
      agreeToRequiredTerms2 = !agreeToRequiredTerms2;
      _StatetoggleAgreement();
    });
  }
  //(필수) 전금 금융 거래 이용 약관 동의 메서드
  void _toggleTermsAgreement2() {
    setState(() {
      agreeToRequiredTerms3 = !agreeToRequiredTerms3;
      _StatetoggleAgreement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1A1A1A),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(title: '모디랑 회원가입', context: context),
              Center(
                child: Container(
                  // 중간 패널
                  width: 428,
                  height: 592,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 54, bottom: 130, right: 24, left: 24),
                    child: Container(
                      height: 108,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '모디랑\n이용약관 동의',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              letterSpacing: -0.6,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '모디랑 서비스 시작 및 가입을 위해\n정보 제공에 동의해 주세요!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.35,
                            ),
                          ),
                          SizedBox(height: 48),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _toggleAgreement();
                              });
                            },
                            child: Container(
                              width: 428,
                              height: 48,
                              decoration: BoxDecoration(
                                color: agreeToAllTerms
                                    ? Color(0xFF05FFF7)
                                    : Colors.transparent, // 여기에서 배경색을 변경합니다.
                                border: Border.all(
                                  width: 1.5,
                                  color: agreeToAllTerms
                                      ? Color(0xFF05FFF7)
                                      : Color(
                                      0xFF05FFF7), // 조건에 따라 테두리 색상을 변경합니다.
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            agreeToAllTerms
                                                ? 'assets/image/checkOn_icon.png'
                                                : 'assets/image/Oncheck_icon.png', // 조건에 따라 이미지를 변경합니다.
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '전체 약관동의',
                                      style: TextStyle(
                                        color: agreeToAllTerms
                                            ? Color(0xFF242424)
                                            : Color(0xFF888888),
                                        // 조건에 따라 텍스트 색상을 변경합니다.
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              AgreementButton(
                                isAgreed: agreeToRequiredTerms1,
                                text: '(필수) 이용 약관 동의',
                                checkedImage: 'assets/image/check_icon.png',
                                uncheckedImage: 'assets/image/Oncheck_icon.png',
                                onTap: () {
                                  _StatetoggleAgreement(); // 상태 변경 함수 호출
                                  setState(() {
                                    _toggleTermsAgreement(); // 동의 상태 변경
                                  });
                                },
                              ),
                              MoreButton(context),
                            ],
                          ),
                          Row(
                            // 동의 2번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              AgreementButton(
                                isAgreed: agreeToRequiredTerms2,
                                text: '(필수) 전금 금융 거래 이용 약관 동의',
                                checkedImage: 'assets/image/check_icon.png',
                                uncheckedImage: 'assets/image/Oncheck_icon.png',
                                onTap: () {
                                  _StatetoggleAgreement(); // 상태 변경 함수 호출
                                  setState(() {
                                    _toggleTermsAgreement1(); // 동의 상태 변경
                                  });
                                },
                              ),
                              MoreButton(context),
                            ],
                          ),
                          Row(
                            // 동의 3번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              AgreementButton(
                                isAgreed: agreeToRequiredTerms3,
                                text: '(필수) 개인정보 수집 동의',
                                checkedImage: 'assets/image/check_icon.png',
                                uncheckedImage: 'assets/image/Oncheck_icon.png',
                                onTap: () {
                                  _StatetoggleAgreement(); // 상태 변경 함수 호출
                                  setState(() {
                                    _toggleTermsAgreement2(); // 동의 상태 변경
                                  });
                                },
                              ),
                              MoreButton(context),
                            ],
                          ),
                          Row( //agreeToSelectTerms
                            // 동의 4번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      agreeToSelectTerms =
                                      !agreeToSelectTerms; // 탭할 때마다 _isPrivacyAgreed 값 토글
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                agreeToSelectTerms
                                                    ? 'assets/image/check_icon.png' // 조건에 따라 이미지 변경
                                                    : 'assets/image/Oncheck_icon.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 3),
                                          child: Row(
                                            children: [
                                              Text(
                                                '(선택) 이벤트 및 마케팅 이용 약관 동의',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: agreeToSelectTerms
                                                      ? Color(0xFF3D3D3D)
                                                      : Color(0xFF888888),
                                                  // 조건에 따라 텍스트 색상 변경
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.0,
                                                  letterSpacing: -0.35,
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
                              MoreButton(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                child: Container(
                  height: 48,
                  width: 428,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // 버튼이 눌렸을 때 수행할 작업을 여기에 구현
                      // 예를 들어, 모든 동의 상태가 true일 때만 다음 화면으로 넘어가는 로직 등
                      if (isButtonPressed) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp_screen()),
                        );
                      }
                    },
                    color: isButtonPressed
                        ? Color(0xFF05FFF7)
                        : Color(0xFFAFA6FF), // 버튼의 상태에 따라 색상 변경
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        letterSpacing: -0.5,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MoreButton(BuildContext context) {
  return Container(
    width: 31,
    height: 24,
    margin: EdgeInsets.only(right: 12),
    padding: EdgeInsets.symmetric(vertical: 6),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () async {
        const url = 'https://holybaits-modir.notion.site/132a2688a39a8092bdefcea510e0fd86';
        final Uri uri = Uri.parse(url); // URL을 Uri로 변환

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri); // URL 열기
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Text(
        '더보기',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 12,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
          decorationColor: Color(0xFFB0B0B0),
          height: 1,
          letterSpacing: -0.3,
        ),
      ),
    ),
  );
}

Widget AgreementButton({
  required bool isAgreed,
  required String text,
  required String checkedImage,
  required String uncheckedImage,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        height: 48,
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(isAgreed ? checkedImage : uncheckedImage),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isAgreed ? Color(0xFF3D3D3D) : Color(0xFF888888),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: -0.35,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}