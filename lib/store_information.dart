import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'setting.dart';





class DataScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          middleText('소개'),
          Container(
            width: 360.w,
            height: 124.h,
            padding: EdgeInsets.only(bottom: 12,top: 12 ,left: 16,right: 16),
            child: Container(
              width: 328.w,
              height: 100.h,
              child: Text(
                '미니멀 브랜드 전문 편집샵 Grass Society입니다.  \n가로수길에 위치한 80평 규모의 하이앤드  편집샵인 저희 Grass Society는 검수된 정식 수입통관된 정품만을 수입 후, \n상주하는 전문 명품 감정사가 1차,2차에 걸친 감정을 통해 100% 정품만을 판매하고 있습니다.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.40.h,
                  letterSpacing: -0.35,
                ),
              ),
            ),
          ),
          middleText('매장 운영시간'),
          Container(
            width: 360.w,
            height: 220.h,
            padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            child: Container(
              width: 328.w,
              height: 204.h,
              decoration: ShapeDecoration(
                color: Color(0xFF242424),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              padding: EdgeInsets.only(top: 8,bottom: 8),
              child: Column(
                children: [
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(월)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(화)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(수)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(목)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(금)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(토)'),
                  SizedBox(height: 8.h),
                  CustomContainer('10 : 00 | 23 : 00', '02 . 24(일)'),

                ],
              ),
            ),
          ),
          middleText('패션'),
          Container(
            width: 360.w,
            height: 92.h,
            padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            child: Container(
              width: 328.w,
              height: 76.h,
              decoration: ShapeDecoration(
                color: Color(0xFF242424),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Container(
                  width: 144.w,
                  height: 44.h,
                  child: Column(children: [
                    Container(
                      width: 144.w,
                      height: 16.h,
                      child: Text(
                        '입점 브랜드',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.30.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 144.w,
                      height: 20.h,
                      child: Text(
                        '8개',
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
                  ],),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 144.w,
                  height: 44.h,
                  child: Column(children: [
                    Container(
                      width: 144.w,
                      height: 16.h,
                      child: Text(
                        '성향',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.30.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 144.w,
                      height: 20.h,
                      child: Text(
                        '미니멀',
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
                  ],),
                ),
              ],),
            ),
          ),
          middleText('조회 비율'),
          Container(
            width: 360.w,
            height: 92.h,
            padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            child: Container(
              width: 328.w,
              height: 76.h,
              decoration: ShapeDecoration(
                color: Color(0xFF242424),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Container(
                  width: 144.w,
                  height: 44.h,
                  child: Column(children: [
                    Container(
                      width: 144.w,
                      height: 16.h,
                      child: Text(
                        '주 연령',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.30.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 144.w,
                      height: 20.h,
                      child: Text(
                        '20대',
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
                  ],),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 144.w,
                  height: 44.h,
                  child: Column(children: [
                    Container(
                      width: 144.w,
                      height: 16.h,
                      child: Text(
                        '성별',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.30.h,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 144.w,
                      height: 20.h,
                      child: Text(
                        '남성 52% 여성 48%',
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
                  ],),
                ),
              ],),
            ),
          ),
          middleText('편의 및 제공 서비스'),
          Container(
            width: 360.w,
            height: 80.h,
          ),
          middleText('SNS'),
          Container(
            width: 360.w,
            height: 32.h,
            padding: EdgeInsets.only(left: 16,right: 8,top: 2,bottom: 2),
            child: Container(
              width: 336.w,
              height: 28.h,
              padding: EdgeInsets.only(top: 4,bottom: 4),
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    child: Icon(
                      Icons.public, // 지구본 아이콘
                      color: Color(0xFF888888), // 아이콘 색상
                      size: 20.sp, // 아이콘 크기
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 312.w,
                    height: 20.h,
                    child: Text(
                      'https://belier.co.kr/',
                      style: TextStyle(
                        color: Color(0xFF05FFF7),
                        fontSize: 14.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40.h,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 360.w,
            height: 32.h,
            padding: EdgeInsets.only(left: 16,right: 8,top: 2,bottom: 2),
            child: Container(
              width: 336.w,
              height: 28.h,
              padding: EdgeInsets.only(top: 4,bottom: 4),
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    child: Icon(
                      Icons.public, // 지구본 아이콘
                      color: Color(0xFF888888), // 아이콘 색상
                      size: 20.sp, // 아이콘 크기
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 312.w,
                    height: 20.h,
                    child: Text(
                      '인스타그램',
                      style: TextStyle(
                        color: Color(0xFF05FFF7),
                        fontSize: 14.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40.h,
                        letterSpacing: -0.35,
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
}


Widget CustomContainer(String timeText, String dateText) {
  return Container(
    width: 328.w,
    height: 20.h,
    padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    child: Row(
      children: [
        Container(
          width: 90.w,
          height: 16.h,
          child: Text(
            timeText,
            textAlign: TextAlign.left,
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
        Container(
          width: 224.w,
          height: 16.h,
          child: Text(
            dateText,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF888888),
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
  );
}