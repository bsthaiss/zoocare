import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/logo_zoocare.png', height: 60),
              const SizedBox(height: 15),
              Text('Cadastre-se',
                  textAlign: TextAlign.center, style: _headerTextStyle),
              const SizedBox(height: 15),
              _buildTextField('E-mail', Icons.email),
              const SizedBox(height: 15),
              _buildTextField('Senha', Icons.lock, obscureText: true),
              const SizedBox(height: 10),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Esqueceu a Senha?',
                      style: TextStyle(color: Colors.grey))),
              const SizedBox(height: 15),
              _buildLoginButton('Entrar'),
              const SizedBox(height: 15),
              const Text('ou entre com',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),
              SocialLoginButton(
                assetName: 'assets/google_icone.png',
                text: 'Entre Com Google',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  TextStyle get _headerTextStyle => TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[800]);

  Widget _buildTextField(String labelText, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE6E6E6),
        prefixIcon: Icon(icon),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget _buildLoginButton(String text) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[800],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String assetName;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.assetName,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(assetName, height: 24.0, width: 24.0),
        label: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
