import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/buildBoxTexto.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';
import 'package:sugarhealth/widgets/campoAvalia%C3%A7ao.dart';
import 'package:sugarhealth/widgets/linhaAvaliacao.dart';
import 'package:sugarhealth/widgets/textoAvaliacao.dart';

import '../widgets/buildInputDecoration.dart';

class Avaliacao extends StatefulWidget {
  const Avaliacao({super.key});

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
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
                  spacing: 22,
                  children: [
                    // --- peso ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Peso Corporal', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('78.9', 0xffA8D3F6),
                      ],
                    ),

                    // --- altura ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Altura', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('1.70cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- idade ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Idade', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('30', 0xffA8D3F6),
                      ],
                    ),

                    // --- genero ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Genero', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('Masculino', 0xffA8D3F6),
                      ],
                    ),

                    // --- TMB ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('TMB', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('1.731,5', 0xffA8D3F6),
                      ],
                    ),

                    // --- IMC ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('IMC', 0xffA8D3F6),
                        Linha(),
                        CampoAvaliacao('20.7', 0xffA8D3F6),
                      ],
                    ),

                    SizedBox(height: 10,),

                    // --- Indicativo de Peso ---
                    Container(
                      height: 60,
                      padding: EdgeInsets.fromLTRB(14, 16, 14, 12),
                      decoration: BoxDecoration(
                        color: Color(0xff97F8ED),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextoAvaliacao('Peso Normal'),
                    ),

                    // --- Indicativo de massa corporal ---
                    Container(
                      height: 60,
                      padding: EdgeInsets.fromLTRB(14, 16, 14, 12),
                      decoration: BoxDecoration(
                        color: Color(0xff97F8ED),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextoAvaliacao('Índice de massa corporal: adequado'),
                    ),

                    SizedBox(height: 8,),

                    // --- Titulo Avaliacao ---
                    TextoAvaliacao('Medida Corporal'),

                    SizedBox(height: 8,),

                    // --- Braço direito ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Braço direito:'),
                        CampoAvaliacao('30,1 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Braço esquerdo ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Braço esquerdo:'),
                        CampoAvaliacao('30,1 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Cintura ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Cintura:'),
                        CampoAvaliacao('80.8 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Ombro ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Ombro:'),
                        CampoAvaliacao('40.2 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Coxa medial Direita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Coxa medial Direita:'),
                        CampoAvaliacao('62 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Coxa medial Esquerda ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Coxa medial Esquerda:'),
                        CampoAvaliacao('62 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Panturrilha Direita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Panturrilha Direita:'),
                        CampoAvaliacao('36 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Panturrilha Esquerda ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Panturrilha Esquerda:'),
                        CampoAvaliacao('36 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Antebraço Direito ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Antebraço Direito:'),
                        CampoAvaliacao('31 cm', 0xffA8D3F6),
                      ],
                    ),

                    // --- Antebraço Esquerdo ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Antebraço Esquerdo:'),
                        CampoAvaliacao('31 cm', 0xffA8D3F6),
                      ],
                    ),

                    SizedBox(height: 6,),

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
                          'Editar Avaliação',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 36,),
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