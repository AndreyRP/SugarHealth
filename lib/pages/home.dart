import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildBoxTexto.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';

import '../widgets/buildInputDecoration.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _glicemiaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  String? _tipoDiabetesSelecionado;
  final List<String> _tiposDiabetes = ['Tipo 1', 'Tipo 2', 'Pré-diabetes'];

  void _calcularGlicemia() {
    if (_glicemiaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, informe a sua glicemia.')),
      );
      return;
    }

    double? glicemia = double.tryParse(_glicemiaController.text);

    if (glicemia == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valor de glicemia inválido.')),
      );
      return;
    }

    String titulo = '';
    String mensagem = '';
    Color corAlerta = Colors.black;

    if (glicemia < 90) {
      titulo = 'Risco de Hipoglicemia';
      mensagem = 'Alerta Crítico: Não recomendar treino.';
      corAlerta = Colors.red;
    } else if (glicemia >= 90 && glicemia <= 150) {
      titulo = 'Faixa Excelente';
      mensagem = 'Treino liberado, carga normal.';
      corAlerta = Colors.green;
    } else if (glicemia >= 151 && glicemia <= 250) {
      titulo = 'Faixa Segura';
      mensagem = 'Treino liberado, mas fique alerta caso apresente tontura.';
      corAlerta = Colors.orange;
    } else {
      titulo = 'Risco de Hiperglicemia/Cetoacidose';
      mensagem = 'Alerta Crítico: Não recomendar treino.';
      corAlerta = Colors.red;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titulo,
            style: TextStyle(color: corAlerta, fontWeight: FontWeight.bold),
          ),
          content: Text(
            mensagem,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
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
              Cabecalho(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Criar Treino/Dieta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                      decoration: BoxDecoration(
                        color: const Color(0xffA5DED4),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        spacing: 26,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
                                      controller: _alturaController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputStylesCalculadora.BuildInputDecorationCalculadora('', 0xffA8D3F6)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 3,
                                child: BuildBoxTexto('Altura em Cm', alignment: Alignment.centerLeft),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
                                    controller: _pesoController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputStylesCalculadora.BuildInputDecorationCalculadora('', 0xffA8D3F6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 3,
                                child: BuildBoxTexto('Peso em Kg', alignment: Alignment.centerLeft),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
                                    controller: _glicemiaController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputStylesCalculadora.BuildInputDecorationCalculadora('', 0xffA8D3F6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 3,
                                child: BuildBoxTexto('Glicose em Mg/dl', alignment: Alignment.centerLeft),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 42,
                                  child: DropdownButtonFormField<String>(
                                    value: _tipoDiabetesSelecionado,
                                    isExpanded: true,
                                    hint: const Text(
                                      'Selecione',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    decoration: InputStylesCalculadora.BuildInputDecorationCalculadora('', 0xffA8D3F6).copyWith(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                                    items: _tiposDiabetes.map((String tipo) {
                                      return DropdownMenuItem<String>(
                                        value: tipo,
                                        child: Text(
                                          tipo,
                                          style: const TextStyle(color: Colors.black, fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
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
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 2,
                                child: BuildBoxTexto('Tipo de Diabetes', alignment: Alignment.centerLeft),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
                                    controller: _idadeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputStylesCalculadora.BuildInputDecorationCalculadora('', 0xffA8D3F6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 3,
                                child: BuildBoxTexto('Idade', alignment: Alignment.centerLeft),
                              ),
                            ],
                          ),
                          const SizedBox(height: 80,),
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
                              onPressed: _calcularGlicemia,
                              child: const Text(
                                'Calcular',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}