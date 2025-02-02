import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SettingState.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchData(); // 초기 데이터 불러오기
    dataProvider.setupRealtimeSubscription(); // 실시간 구독 설정
  }

  @override
  void dispose() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.disposeProvider(); // 리소스 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: dataProvider.dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dataProvider.dataList.length,
        itemBuilder: (context, index) {
          return Table(
            children: [
              TableRow(children: [
                Text('ID: ${dataProvider.dataList[index]['id']}'),
                Text(
                    'Created At: ${dataProvider.dataList[index]['created_at'].split('T')[0]}'),
                Text('Title: ${dataProvider.dataList[index]['title']}'),
                Text('mapy: ${dataProvider.dataList[index]['mapy']}'),
                Text('mapx: ${dataProvider.dataList[index]['mapx']}'),
                Text('roadAddress: ${dataProvider.dataList[index]['roadAddress']}'),
                Text('address: ${dataProvider.dataList[index]['address']}'),
              ]),
            ],
          );
        },
      ),
    );
  }
}