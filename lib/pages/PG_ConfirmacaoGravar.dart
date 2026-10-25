import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/DecoracoesStyle.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../classes/cadastroDieta.dart';

class PgConfirmacaogravar extends StatefulWidget {
  final List<SemanalRefeicao>? dietaSemanal; // Opcional (pode ser null)
  final List<MensalRefeicao>? dietaMensal;   // Opcional (pode ser null)
  final int opcao;                           // Este continua obrigatório

  const PgConfirmacaogravar({
    super.key,
    this.dietaSemanal, // Sem 'required'
    this.dietaMensal,  // Sem 'required'
    required this.opcao,
  });

  @override
  State<PgConfirmacaogravar> createState() => _PgConfirmacaogravarState();
}



class _PgConfirmacaogravarState extends State<PgConfirmacaogravar> {

  int? _cardAbertoIndex = null;

  final List<String> _semana = [
    'Segunda-Feira',
    'Terça-Feira',
    'Quarta-Feira',
    'Quinta-Feira',
    'Sexta-Feira',
    'Sábado',
    'Domingo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextoTitulos('Confirmaçao'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        backgroundColor: const Color(0xffB4EAE1),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoTitulos('Deseja Salvar:'),
                          ],
                        ),
                        SizedBox(height: 12),

                        // Verifica a opção e se a lista correspondente não é nula antes de carregar
                        if (widget.opcao == 1) ...[
                          if (widget.dietaSemanal != null && widget.dietaSemanal!.isNotEmpty)
                            ConfirmacaoGravarDietaSemanal(widget.dietaSemanal!)
                          else
                            TextoPadrao('Nenhuma dieta semanal informada.'),
                        ] else if (widget.opcao == 2) ...[
                          if (widget.dietaMensal != null && widget.dietaMensal!.isNotEmpty)
                            ConfirmacaoGravarDietaMensal(widget.dietaMensal!)
                          else
                            TextoPadrao('Nenhuma dieta mensal informada.'),
                        ],

                        SizedBox(height: 20),

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
                                Navigator.pop(context);
                              },
                              child: Text('Salvar'),
                            ))
                      ],
                    )
                )
            )
        )
    );
  }

  Widget ConfirmacaoGravarDietaSemanal(List<SemanalRefeicao> diaDaSemana) {

    return Container(
      child: Column(
        children: [
          ...List.generate(diaDaSemana.length, (indexDia){
            
            final bool isOpen = _cardAbertoIndex == indexDia;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _cardAbertoIndex = isOpen ? null : indexDia;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: FundoCorBorPretas(0xffffffff, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextoPadrao(_semana[indexDia]),
                          Icon(
                            isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                        ],
                      ),

                      if (isOpen) ...[
                        const SizedBox(height: 16),
                        VisualizarRefeicao(diaDaSemana[indexDia].listaDasRefeicoes)
                      ],
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget ConfirmacaoGravarDietaMensal(List<MensalRefeicao> dietaMensal) {
    return Container(
      child: Column(
        children: [
          ...List.generate(dietaMensal.length, (indexDia){

            final bool isOpen = _cardAbertoIndex == indexDia;

            return Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _cardAbertoIndex = isOpen ? null : indexDia;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: FundoCorBorPretas(0xffffffff, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextoPadrao('${dietaMensal[indexDia].dia}'),
                          Icon(
                            isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                        ],
                      ),

                      if (isOpen) ...[
                        const SizedBox(height: 16),
                        VisualizarRefeicao(dietaMensal[indexDia].listaDasRefeicoesMes)
                      ],
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget VisualizarRefeicao(List<SuaRefeicao> refeicao) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...List.generate(refeicao.length, (index) {
          final umaRefeicao = refeicao[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextoTitulos(refeicao[index].refeicao),
              ...List.generate(umaRefeicao.pratos.length, (indexPrato) {
                final prato = umaRefeicao.pratos[indexPrato];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: TextoPadrao(
                    '   ${prato.nomePrato} - ${prato.quantidade} ${prato.medida}',
                  ),
                );
              }),
              SizedBox(height: 12,)
            ],
          );
        }),
      ],
    );
  }

}



