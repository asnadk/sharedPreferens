import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    bool isLoggedIn = share.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
     
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  void login() async {
 
    if (_usernameController.text == 'akash' && _passwordController.text == '123') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter correct username and password.'),
         
          
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        title: const Text('Login',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white38),),
        centerTitle: true,
      ),
      body: _isLoggedIn
          ? const Center(
              child: Text('Welcome....!'), // You can navigate to Home Page instead of showing this message
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                    TextField(
                controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                    TextField(
                controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: ()async{
                       if ( _passwordController.text == '123') {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const Homepage( ))
                      //      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter correct username and password.'),
         
          
        ),
      );
    }},
 style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
    );
  }
}