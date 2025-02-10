import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'SettingState.dart';
import 'main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  // Supabase 초기화
  await Supabase.initialize(
    url: 'https://ceckhzfboykmsshamikv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNlY2toemZib3lrbXNzaGFtaWt2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0MDU1NTYsImV4cCI6MjA1Mzk4MTU1Nn0.jFJxTniyNAq2cmDrYqFyZYvBVAQFVfkhOhHSms1f_Uk',
  );

  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController(); // 이름 입력 필드 추가
  final _ageController = TextEditingController(); // 나이 입력 필드 추가

  Future<void> _signUp() async {
    try {
      // 회원가입 요청
      final response = await supabase.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (response.session != null) {
        // 회원가입 성공 시 추가 정보 저장
        final user = response.user;
        if (user != null) {
          // profiles 테이블에 이메일과 비밀번호 저장
          await supabase.from('profiles').upsert({
            'email': _emailController.text,
            'password': _passwordController.text, // 비밀번호는 일반적으로 저장하지 않지만, 필요하다면 이렇게 저장
          });

          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}