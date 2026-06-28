import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildLabel.dart';
import 'package:sugarhealth/widgets/createBoxInput.dart';

import '../widgets/inputDecoration.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _obscureText = true;
  bool _obscureTextCon = true;
  String? _tipoDiabetesSelecionado;
  final List<String> _tiposDiabetes = ['Tipo 1', 'Tipo 2', 'Pré-diabetes'];
  final TextEditingController _dataNascimentoController = TextEditingController();
  DateTime? _dataSelecionada;

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );

    if (escolhida != null) {
      setState(() {
        _dataSelecionada = escolhida;

        String dia = escolhida.day.toString().padLeft(2, '0');
        String mes = escolhida.month.toString().padLeft(2, '0');
        String ano = escolhida.year.toString();

        _dataNascimentoController.text = "$dia/$mes/$ano";
      });
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
              Container(
                decoration: const BoxDecoration(color: Color(0xffA8D3F6)),
                margin: const EdgeInsets.only(top: 40, bottom: 30),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Center(
                  child: Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [

                    // --- CAMPO: NOME DO USUÁRIO ---
                    BuildInputLabel('Nome do Usuário'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        decoration: InputStyles.BuildInputDecoration('Digite o nome'),
                      ),
                    ),
                    const SizedBox(height: 16),



                    // --- CAMPO: TIPO DE DIABETES ---
                    BuildInputLabel('Tipo de diabetes'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: DropdownButtonFormField<String>(
                        value: _tipoDiabetesSelecionado,
                        hint: const Text(
                          'Digite o tipo de diabetes',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffACA4A4),
                          ),
                        ),
                        decoration: InputStyles.BuildInputDecoration(''),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                        items: _tiposDiabetes.map((String tipo) {
                          return DropdownMenuItem<String>(
                            value: tipo,
                            child: Text(
                              tipo,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? novoValor) {
                          setState(() {
                            _tipoDiabetesSelecionado = novoValor;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- CAMPO: E-MAIL ---
                    BuildInputLabel('E-mail'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputStyles.BuildInputDecoration('E-mail do usuário'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- CAMPO: TELEFONE ---
                    BuildInputLabel('Digite seu telefone'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputStyles.BuildInputDecoration('Digite seu telefone'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- CAMPO: DATA DE NASCIMENTO ---
                    BuildInputLabel('Data de Nascimento'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _dataNascimentoController,
                        readOnly: true,
                        onTap: () => _selecionarData(context),
                        decoration: InputStyles.BuildInputDecoration('Selecione sua data de nascimento').copyWith(
                          suffixIcon: const Icon(Icons.calendar_month, color: Color(0xffACA4A4)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),


                    // --- CAMPO: CRIAR SENHA ---
                    BuildInputLabel('Criar Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        obscureText: _obscureText,
                        decoration: InputStyles.BuildInputDecoration('Crie sua senha').copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xffACA4A4),
                            ),
                            onPressed: () => setState(() => _obscureText = !_obscureText),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- CAMPO: CONFIRME SUA SENHA ---
                    BuildInputLabel('Confirme sua Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        obscureText: _obscureTextCon,
                        decoration: InputStyles.BuildInputDecoration('Confirme sua senha').copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextCon ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xffACA4A4),
                            ),
                            onPressed: () => setState(() => _obscureTextCon = !_obscureTextCon),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Botão de Criar Conta
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff97F8ED),
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
                    'Criar Conta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botão de Informação/Ajuda no final da página
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.help_outline),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                        print("Usuário pediu informação");
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}