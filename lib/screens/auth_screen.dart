import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();

  bool isLogin = true;
  String _enteredEmail = "";
  String _enteredPassword = "";

  void _onSubmit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    formKey.currentState!.save();

    try {
      if (isLogin) {
        final data = await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        print(data);
      } else {
        final data = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        print(data);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed.', textAlign: TextAlign.center),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: 350,
              child: Image.asset("assets/images/chat.png"),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        _enteredEmail = value.trim();
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        _enteredPassword = value;
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      obscureText: true,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: _onSubmit,
                      child: isLogin ? Text("Login") : Text("Sign up"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: isLogin
                          ? Text(
                              "Don't have any account? Sign up",
                              style: TextStyle(color: Colors.white70),
                            )
                          : Text(
                              "Already have an account? Login",
                              style: TextStyle(color: Colors.white70),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
