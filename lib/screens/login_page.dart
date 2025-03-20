import 'package:flutter/material.dart';

class Credentials {
  Credentials({required this.username, required this.password});
  final String username;
  final String password;
}

class LoginPage extends StatelessWidget {
  final ValueChanged<Credentials> onLogIn;
  
  const LoginPage({
    super.key,
    required this.onLogIn,
  });

  Widget _buildDesktopLogin() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/login_background.webp',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: FractionallySizedBox(
            widthFactor: 0.70,
            child: LoginForm(
              onLogIn: onLogIn,
            ),
          )
        ),
      ],
    );
  }

  Widget _buildMobileLogin() {
    return Column(
      children: [
        Expanded(
          child: LoginForm(onLogIn: onLogIn),
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) return _buildDesktopLogin();
          return _buildMobileLogin();
        }
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueChanged<Credentials> onLogIn;
  
  LoginForm({
    super.key,
    required this.onLogIn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/yummy_logo.png',
            width: 150.0,
            height: 150.0,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              onLogIn(Credentials(
                username: _usernameController.text,
                password: _passwordController.text,
              ));
            },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}