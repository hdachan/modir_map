import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase 초기화
  await Supabase.initialize(
    url: '1',
    anonKey: '1',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Example',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final supabase = Supabase.instance.client;
  List<dynamic> dataList = [];
  late RealtimeChannel _realtimeChannel;

  @override
  void initState() {
    super.initState();
    fetchData();
    _setupRealtimeSubscription();
  }

  @override
  void dispose() {
    _realtimeChannel.unsubscribe();
    super.dispose();
  }

  // 실시간 구독 설정 (Supabase 최신 방식)
  void _setupRealtimeSubscription() {
    _realtimeChannel = supabase.channel('modir_channel').onPostgresChanges(
      event: PostgresChangeEvent.all, // 모든 변경 감지
      schema: 'public',
      table: 'modir',
      callback: (payload) {
        fetchData(); // 변경 발생 시 데이터 갱신
      },
    ).subscribe();
  }

  // 데이터 불러오기
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
        setState(() {
          dataList = response;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Table(
            children: [
              TableRow(children: [
                Text('ID: ${dataList[index]['id']}'),
                Text('Created At: ${dataList[index]['created_at'].split('T')[0]}'),
                Text('Title: ${dataList[index]['title']}'),
              ]),
            ],
          );
        },
      ),
    );
  }
}
