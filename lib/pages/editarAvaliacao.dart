import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/MedidasCorporal.dart';

import '../widgets/buildInputDecoration.dart';
import '../widgets/textoAvaliacao.dart';
import 'avaliacaoMedidas.dart';

class EditarMedidas extends StatefulWidget {
  const EditarMedidas({Key? key}) : super(key: key);

  @override
  _EditarMedidasState createState() => _EditarMedidasState();
}

  class _EditarMedidasState extends State<EditarMedidas> {

    final TextEditingController _bracoDireito = TextEditingController();
    final TextEditingController _bracoEsquerdo = TextEditingController();
    final TextEditingController _cintura = TextEditingController();
    final TextEditingController _ombro = TextEditingController();
    final TextEditingController _coxaDireita = TextEditingController();
    final TextEditingController _coxaEsquerda = TextEditingController();
    final TextEditingController _panturrilhaDireita = TextEditingController();
    final TextEditingController _panturrilhaEsquerda = TextEditingController();
    final TextEditingController _anteBracoDireito = TextEditingController();
    final TextEditingController _anteBracoEsquerdo = TextEditingController();

    double PassaParaDouble(String texto) {
      double valor = double.tryParse(texto)!;
      return valor;
    }

    Salvar(BuildContext context) {
      if (
      _anteBracoEsquerdo.text.isEmpty ||
          _anteBracoDireito.text.isEmpty ||
          _bracoEsquerdo.text.isEmpty ||
          _bracoDireito.text.isEmpty ||
          _coxaEsquerda.text.isEmpty ||
          _coxaDireita.text.isEmpty ||
          _cintura.text.isEmpty ||
          _ombro.text.isEmpty ||
          _panturrilhaEsquerda.text.isEmpty ||
          _panturrilhaDireita.text.isEmpty
      ) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, preencha todos os campos!')),
        );
        return;
      }

      setState(() {
        medidas = Medidascorporal(
          PassaParaDouble(_bracoDireito.text),
          PassaParaDouble(_bracoEsquerdo.text),
          PassaParaDouble(_cintura.text),
          PassaParaDouble(_ombro.text),
          PassaParaDouble(_coxaDireita.text),
          PassaParaDouble(_coxaEsquerda.text),
          PassaParaDouble(_panturrilhaDireita.text),
          PassaParaDouble(_panturrilhaEsquerda.text),
          PassaParaDouble(_anteBracoDireito.text),
          PassaParaDouble(_anteBracoEsquerdo.text),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medidas Salvas com Sucesso')),
      );

      Navigator.pop(context);
    }

    @override
    void dispose() {
      _bracoDireito.dispose();
      _bracoEsquerdo.dispose();
      _cintura.dispose();
      _ombro.dispose();
      _coxaDireita.dispose();
      _coxaEsquerda.dispose();
      _panturrilhaDireita.dispose();
      _panturrilhaEsquerda.dispose();
      _anteBracoDireito.dispose();
      _anteBracoEsquerdo.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Editar Suas Medidas Corporais',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),

          backgroundColor: const Color(0xffB4EAE1),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Braço direito:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _bracoDireito,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.bracoDireito}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Braço esquerdo ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Braço esquerdo:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _bracoEsquerdo,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.bracoEsquerdo}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Cintura ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Cintura:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _cintura,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.cintura}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Ombro ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Ombro:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _ombro,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.ombro}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Coxa medial Direita ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Coxa medial Direita:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _coxaDireita,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.coxaDireita}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Coxa medial Esquerda ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Coxa medial Esquerda:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _coxaEsquerda,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.coxaEsquerda}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Panturrilha Direita ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Panturrilha Direita:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _panturrilhaDireita,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.panturrilhaDireita}',
                                    0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Panturrilha Esquerda ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Panturrilha Esquerda:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _panturrilhaEsquerda,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.panturrilhaEsquerda}',
                                    0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Antebraço Direito ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Antebraço Direito:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _anteBracoDireito,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.anteBracoDireito}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Antebraço Esquerdo ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextoAvaliacao('Antebraço Esquerdo:'),
                            SizedBox(
                              width: 100,
                              height: 42,
                              child: TextField(
                                controller: _anteBracoEsquerdo,
                                textAlign: .center,
                                decoration: InputStylesCalculadora
                                    .BuildInputDecorationCalculadora(
                                    '${medidas.anteBracoEsquerdo}', 0xffA8D3F6),
                              ),
                            )
                          ],
                        ),

                        // --- Salvar ---
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff97F8ED),
                              side: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              minimumSize: const Size(220, 42),
                            ),
                            onPressed: () => Salvar(context),
                            child: const Text(
                              'Salvar',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
          )
      );
    }
  }