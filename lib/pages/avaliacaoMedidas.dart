import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/MedidasCorporal.dart';
import 'package:sugarhealth/pages/editarAvaliacao.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';
import 'package:sugarhealth/widgets/campoAvaliacao.dart';
import 'package:sugarhealth/widgets/linhaAvaliacao.dart';
import 'package:sugarhealth/widgets/textoAvaliacao.dart';

import '../widgets/menuRetratio.dart';

Medidascorporal medidas = Medidascorporal(30.1, 30.1, 80.8, 40.2, 62, 62, 36, 36, 31, 31);

class Avaliacao extends StatefulWidget {
  const Avaliacao({super.key});

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: const Color(0xffB4EAE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                        CampoAvaliacao('Peso Corporal', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('78.9', 0xffA8D3F6, 140),
                      ],
                    ),

                    // --- altura ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Altura', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('1.70cm', 0xffA8D3F6, 140),
                      ],
                    ),

                    // --- idade ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Idade', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('30', 0xffA8D3F6, 140),
                      ],
                    ),

                    // --- genero ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('Genero', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('Masculino', 0xffA8D3F6, 140),
                      ],
                    ),

                    // --- TMB ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('TMB', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('1.731,5', 0xffA8D3F6, 140),
                      ],
                    ),

                    // --- IMC ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampoAvaliacao('IMC', 0xffA8D3F6, 140),
                        Linha(),
                        CampoAvaliacao('20.7', 0xffA8D3F6, 140),
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
                      child: TextoAvaliacao('Massa corporal: adequado'),
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
                        CampoAvaliacao('${medidas.bracoDireito} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Braço esquerdo ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Braço esquerdo:'),
                        CampoAvaliacao('${medidas.bracoEsquerdo} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Cintura ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Cintura:'),
                        CampoAvaliacao('${medidas.cintura} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Ombro ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Ombro:'),
                        CampoAvaliacao('${medidas.ombro} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Coxa medial Direita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Coxa medial Direita:'),
                        CampoAvaliacao('${medidas.coxaDireita} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Coxa medial Esquerda ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Coxa medial Esquerda:'),
                        CampoAvaliacao('${medidas.coxaEsquerda} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Panturrilha Direita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Panturrilha Direita:'),
                        CampoAvaliacao('${medidas.panturrilhaDireita} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Panturrilha Esquerda ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Panturrilha Esquerda:'),
                        CampoAvaliacao('${medidas.panturrilhaEsquerda} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Antebraço Direito ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Antebraço Direito:'),
                        CampoAvaliacao('${medidas.anteBracoDireito} cm', 0xffA8D3F6, 100),
                      ],
                    ),

                    // --- Antebraço Esquerdo ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoAvaliacao('Antebraço Esquerdo:'),
                        CampoAvaliacao('${medidas.anteBracoEsquerdo} cm', 0xffA8D3F6, 100),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditarMedidas()),
                          ).then((_) {
                            setState(() {});
                          });
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