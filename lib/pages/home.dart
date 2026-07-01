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

                    // -- Titulo criar Dieta/Treino ---
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

                    // --- Container Calculadora ---
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
                        mainAxisAlignment: .start,
                        children: [

                          // --- Altura ---
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
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

                          // --- Peso ---
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
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

                          // --- Glicemia ---
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 42,
                                  child: TextField(
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

                          // --- Tipo de Diabetes ---
                          Row(
                            children: [
                              Expanded(
                                child: BuildBoxTexto('Diabetes tipo 2', alignment: Alignment.center),
                              ),
                            ],
                          ),

                          // --- Idade ---
                          Row(
                            children: [
                              Expanded(
                                child: BuildBoxTexto('Idade de 39 anos ', alignment: Alignment.center),
                              ),
                            ],
                          ),

                          SizedBox(height: 80,),

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