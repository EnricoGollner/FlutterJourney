import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//formKey
  final _formKey = GlobalKey<FormState>();

  final _emailFormController = TextEditingController();
  final _passFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/background.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.purple.withOpacity(0.14),
          ),
          _body(
              formKey: _formKey,
              emailFormController: _emailFormController,
              passFormController: _passFormController)
        ],
      ),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailFormController,
    required TextEditingController passFormController,
  })  : _formKey = formKey,
        _emailFormController = emailFormController,
        _passFormController = passFormController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailFormController;
  final TextEditingController _passFormController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width:
            MediaQuery.of(context).size.width, // Pega a largura total da tela
        height:
            MediaQuery.of(context).size.height, // Pega a altura total da tela
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoginForm(
              formKey: _formKey,
              emailFormController: _emailFormController,
              passFormController: _passFormController),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailFormController,
    required TextEditingController passFormController,
  })  : _formKey = formKey,
        _emailFormController = emailFormController,
        _passFormController = passFormController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailFormController;
  final TextEditingController _passFormController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/flutterando_logo.jpeg"),
          ),
          const SizedBox(height: 50),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailFormController,
            decoration: InputDecoration(
              labelText: "E-mail",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            controller: _passFormController,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              login(context);
            },
            child: const Text("Entrar"),
          )
        ],
      ),
    );
  }

  void login(context) {
    String email = _emailFormController.text;
    String pass = _passFormController.text;
    if (email.isNotEmpty && pass.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(),
      //   ),
      // );
    }
  }
}
