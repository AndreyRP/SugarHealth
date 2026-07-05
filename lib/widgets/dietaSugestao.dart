import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';
import 'package:sugarhealth/widgets/suaDieta.dart';

import '../classes/refeiçao.dart';
import 'menuDieta.dart';

class DietaSugestao extends StatefulWidget {
  final int opcao;

  const DietaSugestao({
    super.key,
    required this.opcao
  });

  @override
  State<DietaSugestao> createState() => _DietaSugestaoState();
}

class _DietaSugestaoState extends State<DietaSugestao> {
  int? _cardAbertoIndex = null;

  // --- direciona para qual menu deve ser carregado
  Widget _carregarConteudo(Refeicao refeicao, SuaRefeicao suaRefeicao, BuildContext context) {
    switch (widget.opcao) {
      case 0:
      return  MenuDieta(refeicao, context);
      case 1:
      return SuaDieta(suaRefeicao);
      default:
      return const Center(child: Text('Nenhuma opção selecionada'));
      }
}

  // --- Geraçao das variavies dos menus ---
  final List<SuaRefeicao> _suarefeicoes = [
    SuaRefeicao(
      'Café da manhã',
      [
        Prato('Ovo mexido', 160, 'G'),
        Prato('Pão integral', 80, 'G'),
        Prato('Mamão papaia', 120, 'G'),
      ],
    ),
    SuaRefeicao(
      'Lanche da manhã',
      [
        Prato('Iogurte natural', 200, 'ML'),
        Prato('Aveia em flocos', 150, 'G'),
      ],
    ),
    SuaRefeicao(
      'Almoço',
      [
        Prato('Arroz integral', 80, 'G'),
        Prato('Feijão carioca', 60, 'G'),
        Prato('Filé de frango grelhado', 120.0, 'G'),
        Prato('Salada de alface e tomate', 140, 'G'),
      ],
    ),
    SuaRefeicao(
      'Lanche da tarde',
      [
        Prato('Banana', 100, 'G'),
        Prato('Pasta de amendoim', 30, 'G'),
      ],
    ),
    SuaRefeicao(
      'Jantar',
      [
        Prato('Patinho moído', 100.0, 'G'),
        Prato('Purê de batata doce', 100, 'G'),
        Prato('Brócolis ao vapor', 80, 'G'),
      ],
    ),
    SuaRefeicao(
      'Ceia',
      [
        Prato('Castanha-do-pará', 40, 'G'),
        Prato('Chá de camomila', 200.0, 'ml'),
      ],
    ),
  ];

  final List<Refeicao> _refeicoes = [
    Refeicao('Café da manhã'),
    Refeicao('Lanche da manhã'),
    Refeicao('Almoço'),
    Refeicao('Lanche da tarde'),
    Refeicao('Jantar'),
    Refeicao('Ceia'),
  ];


  // --- Criando conteiners com os titulos dos menus ---
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: List<Widget>.generate(_refeicoes.length, (int index) {
          final bool isOpen = _cardAbertoIndex == index;
          final Refeicao refeicaoAtual = _refeicoes[index];
          final SuaRefeicao suaRefeicaoAtual = _suarefeicoes[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _cardAbertoIndex = isOpen ? null : index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffBCEAE5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          refeicaoAtual.refeicao,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ],
                    ),

                    if (isOpen) ...[
                      const SizedBox(height: 16),

                      // --- envia os dois para dependendo da opcao gerar o menu correto ---
                      _carregarConteudo(refeicaoAtual, suaRefeicaoAtual, context),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}