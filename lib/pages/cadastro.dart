import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildLabel.dart';
import 'package:sugarhealth/widgets/createBoxInput.dart';
import '../widgets/inputDecoration.dart';

String? nomeSalvo;
String? tipoDiabetesSalvo;
String? emailSalvo;
String? telefoneSalvo;
String? dataNascimentoSalva;
String? senhaSalva;

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

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();

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

  void _realizarCadastro() {
    if (_nomeController.text.isEmpty ||
        _tipoDiabetesSelecionado == null ||
        _emailController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        _dataNascimentoController.text.isEmpty ||
        _senhaController.text.isEmpty ||
        _confirmaSenhaController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    if (_senhaController.text != _confirmaSenhaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas digitadas não coincidem!')),
      );
      return;
    }

    nomeSalvo = _nomeController.text;
    tipoDiabetesSalvo = _tipoDiabetesSelecionado;
    emailSalvo = _emailController.text;
    telefoneSalvo = _telefoneController.text;
    dataNascimentoSalva = _dataNascimentoController.text;
    senhaSalva = _senhaController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Conta criada com sucesso!')),
    );

    Navigator.pushReplacementNamed(context, '/login');
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
                    BuildInputLabel('Nome do Usuário'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _nomeController,
                        decoration: InputStyles.BuildInputDecoration('Digite o nome'),
                      ),
                    ),
                    const SizedBox(height: 16),

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

                    BuildInputLabel('E-mail'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputStyles.BuildInputDecoration('E-mail do usuário'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    BuildInputLabel('Digite seu telefone'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _telefoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputStyles.BuildInputDecoration('Digite seu telefone'),
                      ),
                    ),
                    const SizedBox(height: 16),

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

                    BuildInputLabel('Criar Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _senhaController,
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

                    BuildInputLabel('Confirme sua Senha'),
                    const SizedBox(height: 6),
                    BuildInputContainer(
                      child: TextField(
                        controller: _confirmaSenhaController,
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
                  onPressed: _realizarCadastro,
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 20),

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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Preencha os dados para criar seu perfil no Sugar Health.')),
                        );
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