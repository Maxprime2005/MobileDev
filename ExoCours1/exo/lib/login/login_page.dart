import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login in or sign up',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
