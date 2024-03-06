import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projee/crud_islem.dart';
import 'package:projee/firebase_options.dart';
import 'package:projee/kullanicigiris.dart'; // Import the KullaniciGiris.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData.light(useMaterial3: true),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giriş Sayfası',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
            fontSize: 20, // Increase the font size
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/logo.png", height: 100),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'KULLANICI ADI',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'ŞİFRE',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kullanıcı adı ve parolayı kontrol et
                if (_usernameController.text == 'mehmetemin' &&
                    _passwordController.text == 'password') {
                  setState(() {
                    _isLoggedIn = true;
                    _usernameController.clear(); // Clear the username field
                    _passwordController.clear(); // Clear the password field
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KullaniciGiris(
                            ad: _usernameController.text,
                            parola: _passwordController.text)),
                  );
                }
              },
              child: Text('Login'),
            ),
            if (_isLoggedIn == true)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EvOkulu()),
                  );
                },
                child: Text('Go to EvOkulu'),
              ),
          ],
        ),
      ),
    );
  }
}
