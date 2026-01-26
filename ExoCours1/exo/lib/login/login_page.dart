import 'package:cours_01/res/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login in or sign up',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            children: [
              EmailAddress(),
              ContinueButton(),
              OrDivider(),
              ContinueWithButton(
                label: 'Continue with Apple',
                asset: 'assets/apple_logo.svg',
                onPressed: () {},
              ), 
            ],
          ),
        ) 
      ),
    );
  }
}

class EmailAddress extends StatelessWidget {
  const EmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: 'Email Address',
        hintStyle: TextStyle(color: AppColors.textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.inputFieldActiveBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.inputFieldInactiveBackground),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({
    required this.asset,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
