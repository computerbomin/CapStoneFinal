import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../kakao/kakao_login.dart';
import '../kakao/kakao_main_view_model.dart';
import '../kakao/kako_login_page.dart';
import '../my_button/my_button.dart';
import './google_login.dart';
import './home.dart';

class LogInRefac extends StatefulWidget {
  @override
  State<LogInRefac> createState() => _LogInRefacState();
}

class _LogInRefacState extends State<LogInRefac> {
  final viewModel = KakaoMainViewModel(KakaoLogin());

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    signOut();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text(
            "T4 캘린더",
            style: TextStyle(
              fontFamily: 'Gamja_Flower',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
        ),
        body: _buildButton(),
      ),
    );
  }

  // Prvate build options
  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*
          MyButton(
            image: Image.asset('image/glogo.png'),
            text: Text(
              'Login with Google',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleLogin()),
              );
            },
          ),

          SizedBox(
            height: 10.0,
          ),

          MyButton(
            image: Image.asset('image/klogo.png'),
            text: Text(
              'Login with KakaoTalk',
              style: TextStyle(color: Colors.brown, fontSize: 15.0),
            ),
            color: Colors.amberAccent,
            radius: 4.0,
            onPressed: () async {
              await viewModel.login();
              setState((){});
            },
          ),

          SizedBox(
            height: 10.0,
          ),
           */
          CircleAvatar(
            radius: 200,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5), // Border radius
              child: ClipOval(child: Image.asset('image/close.png'))),
            ),
          MyButton(
            image: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            text: Text(
              '   로그인',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Gamja_Flower'),
            ),
            color: Colors.green,
            radius: 4.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
