import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/parser.dart' as html_parser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naver Local Search API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NaverLocalSearchPage(),
    );
  }
}

class NaverLocalSearchPage extends StatefulWidget {
  @override
  _NaverLocalSearchPageState createState() => _NaverLocalSearchPageState();
}

class _NaverLocalSearchPageState extends State<NaverLocalSearchPage> {
  bool _isLoading = false;
  String _responseBody = "검색 결과가 여기에 표시됩니다.";
  final TextEditingController _searchController = TextEditingController(); // 텍스트 필드 컨트롤러

  Future<void> _fetchData(String query) async {
    setState(() {
      _isLoading = true;
    });

    final String clientId = '1'; // 네이버 개발자 센터에서 발급받은 Client ID
    final String clientSecret = '1'; // 네이버 개발자 센터에서 발급받은 Client Secret
    final String url =
        'https://openapi.naver.com/v1/search/local.json?query=$query&display=5&start=1&sort=sim';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-Naver-Client-Id': clientId,
          'X-Naver-Client-Secret': clientSecret,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['items'];
        setState(() {
          _responseBody = items.map((item) {
            // HTML 태그를 제거하고 텍스트만 반환
            final title = item['title'];
            final document = html_parser.parse(title);
            final cleanTitle = document.body?.text ?? '';

            // 위도와 경도 가져오기
            final latitude = item['mapy']; // 위도 (문자열)
            final longitude = item['mapx']; // 경도 (문자열)

            // 위도와 경도를 소수점 형태로 변환
            final parsedLatitude = _parseCoordinate(latitude, isLatitude: true);
            final parsedLongitude = _parseCoordinate(longitude, isLatitude: false);

            // 도로명 주소와 지번 주소 가져오기
            final roadAddress = item['roadAddress'] ?? '도로명 주소 없음'; // 도로명 주소
            final address = item['address'] ?? '지번 주소 없음'; // 지번 주소

            // 결과 문자열 생성
            return '$cleanTitle\n'
                '도로명: $roadAddress\n'
                '지번: $address\n'
                '위도: $parsedLatitude, 경도: $parsedLongitude\n';
          }).join('\n');
        });
      } else {
        setState(() {
          _responseBody = 'Failed to load data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _responseBody = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

// 좌표를 소수점 형태로 변환하는 함수
  String _parseCoordinate(String coordinate, {required bool isLatitude}) {
    if (coordinate.isEmpty) return '0.0';

    // 위도는 앞의 2자리가 정수 부분, 경도는 앞의 3자리가 정수 부분
    final integerLength = isLatitude ? 2 : 3;

    // 정수 부분과 소수 부분 분리
    final integerPart = coordinate.substring(0, integerLength);
    final decimalPart = coordinate.substring(integerLength);

    // 소수점 추가
    return '$integerPart.$decimalPart';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naver Local Search API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 텍스트 필드 추가
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: '검색어를 입력하세요',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // 검색 버튼을 눌렀을 때 API 호출
                      if (_searchController.text.isNotEmpty) {
                        _fetchData(_searchController.text);
                      }
                    },
                  ),
                ),
                onSubmitted: (value) {
                  // 엔터를 눌렀을 때 API 호출
                  if (value.isNotEmpty) {
                    _fetchData(value);
                  }
                },
              ),
            ),
            if (_isLoading)
              CircularProgressIndicator()
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _responseBody,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () {
                // 버튼을 눌렀을 때 API 호출
                if (_searchController.text.isNotEmpty) {
                  _fetchData(_searchController.text);
                }
              },
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}