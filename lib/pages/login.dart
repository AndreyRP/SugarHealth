import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildLabel.dart';
import 'package:sugarhealth/widgets/createBoxInput.dart';

import '../widgets/inputDecoration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4EAE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Área da Logo Centralizada
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

                    // --- CAMPO: USUÁRIO ---
                    BuildInputLabel('Usuário'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        decoration: InputStyles.BuildInputDecoration('Nome do usuário'),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // --- CAMPO: SENHA ---
                    BuildInputLabel('Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        obscureText: _obscureText,
                        // ✅ Usa o estilo reaproveitável do outro arquivo + o .copyWith() para o botão do olho
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

              // Area dos botoes
              Center(
                child: Column(
                  children: [

                    // Botão de Login
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
                      onPressed: () {
                        print('Botão Clicado!');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Link: Esqueci a senha
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

                    // Link: Cadastrar-se
                    TextButton(
                      onPressed: () {},
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