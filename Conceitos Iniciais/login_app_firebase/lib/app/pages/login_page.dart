import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/app/auth.dart';
import 'package:login_app/app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? errorMessage = '';

  bool _isObscureText = true;

  final bool _isLogin = true;
  bool _loading = false;

  void handleSubmit() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processando dados...')),
      );

      if (_isLogin) {
        try {
          Auth().loginUser(email, password);
        } on FirebaseAuthException catch (e) {
          setState(() {
            errorMessage = e.message;
          });
        }

        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        try {
          Auth().registerUser(email, password);
        } on FirebaseAuthException catch (e) {
          setState(() {
            errorMessage = e.message;
          });
        }
      }

      setState(() => _loading = false);
    }
  }

  String? validate(String? tfValue) {
    if (tfValue == null || tfValue.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Logue aqui',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                      hintText: 'Digite seu e-mail',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      icon: Icon(Icons.email),
                    ),
                    validator: (value) => validate(value),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscureText,
                    decoration: InputDecoration(
                      label: const Text('Senha'),
                      hintText: 'Digite sua senha',
                      icon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                        icon: _isObscureText
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.green,
                              ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) => validate(value),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _isLogin ? Colors.green : Colors.red),
                    onPressed: () => handleSubmit(),
                    child: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(_isLogin ? 'Login' : 'Register'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
