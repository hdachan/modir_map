import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SettingState.dart';


//테스트 화면
class Logout_screen extends StatelessWidget {
  const Logout_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        actions: [
          IconButton(
            onPressed: () async {
              await authProvider.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('환영합니다!'),
      ),
    );
  }
}