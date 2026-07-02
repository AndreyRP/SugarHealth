import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildLabel.dart';
import 'package:sugarhealth/widgets/createBoxInput.dart';

import '../widgets/inputDecoration.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _validarLogin() {
    String usuarioDigitado = _usuarioController.text;
    String senhaDigitada = _senhaController.text;

    if (nomeSalvo == null || senhaSalva == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum usuário cadastrado. Faça o cadastro primeiro.')),
      );
      return;
    }

    if (usuarioDigitado == nomeSalvo && senhaDigitada == senhaSalva) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login validado com sucesso!')),
      );

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha incorretos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4EAE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 70),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 205,
                    height: 195,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildInputLabel('Usuário'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _usuarioController,
                        decoration: InputStyles.BuildInputDecoration('Nome do usuário'),
                      ),
                    ),

                    const SizedBox(height: 24),

                    BuildInputLabel('Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _senhaController,
                        obscureText: _obscureText,
                        decoration: InputStyles.BuildInputDecoration('Digite sua senha').copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xffACA4A4),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff97F8ED),
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(220, 42),
                      ),
                      onPressed: _validarLogin,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueci a senha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff3D6490),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Cadastrar - se',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff3D6490),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}