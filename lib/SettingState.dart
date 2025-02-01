import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabase = Supabase.instance.client; // Supabase 클라이언트 인스턴스
List<dynamic> dataList = [];


class SettingState extends ChangeNotifier {

  // 현재 선택된 하단바 인덱스
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // 하단바 인덱스 변경 메서드
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

// NaverMapProvider 클래스 정의
class NaverMapProvider with ChangeNotifier {
  // 상태 관리에 필요한 변수와 메서드 정의
}




class DataProvider with ChangeNotifier {

  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    try {
      final response = await supabase
          .from('modir')
          .select()
          .catchError((error) {
        print('Error fetching data: $error');
        return null;
      });

      if (response != null) {
        dataList = response;
        notifyListeners(); // 상태 변경 알림
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


