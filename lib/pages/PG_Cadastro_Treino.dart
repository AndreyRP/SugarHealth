import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../classes/exercicios.dart';
import '../widgets/DecoracoesStyle.dart';
import '../widgets/buildBox.dart';
import '../widgets/createBoxInput.dart';
import '../widgets/inputDecoration.dart';

class PgCadastroTreino extends StatefulWidget {
  const PgCadastroTreino({super.key});

  @override
  State<PgCadastroTreino> createState() => _PgCadastroTreinoState();
}

class _PgCadastroTreinoState extends State<PgCadastroTreino> {
  int? _cardAbertoIndex = null;

  final TextEditingController _exercicio = TextEditingController();
  final TextEditingController _serie = TextEditingController();
  final TextEditingController _repeticao = TextEditingController();
  
  final List<CategoriaTreino> treinos = [
    CategoriaTreino(nome: "Costas", exercicios: []),
    CategoriaTreino(nome: "Perna", exercicios: []),
    CategoriaTreino(nome: "Ombro", exercicios: []),
    CategoriaTreino(nome: "Triceps", exercicios: []),
    CategoriaTreino(nome: "Bíceps", exercicios: []),
    CategoriaTreino(nome: "Peito", exercicios: []),
  ];

  final List<CategoriaTreinoDetalhado> treinosSemana = [
    CategoriaTreinoDetalhado(nome: "Segunda-Feira", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Terça-Feira", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Quarta-Feira", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Quinta-Feira", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Sexta-Feira", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Sábado", exercicios: []),
    CategoriaTreinoDetalhado(nome: "Domingo", exercicios: []),
  ];

  int? _opcaoSelecionada = 0;
  final List<String> _opcoes = ['Grupo Muscular', 'Dia Semana'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: SubMenu(),
        ),

        SizedBox(height: 24,),

        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min, // Essencial para evitar conflitos de altura no scroll
            children: [
              const SizedBox(height: 16),
              _opcaoSelecionada == 0
                  ? Conteudo(treinos)
                  : ConteudoSemana(treinosSemana),
            ],
          ),
        )
      ],
    );
  }

  Widget SubMenu(){
    return Container(
      decoration: FundoCorBorPretas(0xffBCEAE5, 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List<Widget>.generate(_opcoes.length, (int index) {
          final bool isSelected = _opcaoSelecionada == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _opcaoSelecionada = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Column(
                children: [
                  Text(
                    _opcoes[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 1),
                    height: 2.0,
                    width: 80.0,
                    color: isSelected ? Colors.black : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget Conteudo(List<CategoriaTreino> categoria){
    return Column(
      spacing: 12,
      children: [
        ...List.generate(categoria.length, (index){

          final bool isOpen = _cardAbertoIndex == index;
          final cat = categoria[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _cardAbertoIndex = isOpen ? null : index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF14A38B),
                      borderRadius: BorderRadius.circular(10),
                      border: .all(width: 2, color: Colors.black)
                    ),
                    child: Column(
                        children: [
                          Align(
                            alignment: .bottomLeft,
                            child: TextoPadraoBold(cat.nome),
                          ),

                          isOpen ?
                          Column(
                            children: [
                              SizedBox(height: 6),
                              BuildInputContainer(
                                child: TextField(
                                  controller: _exercicio,
                                  decoration: InputStyles.BuildInputDecoration('Digite o nome do exercicio'),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: BuildInputContainer(
                                        child: TextField(
                                          controller: _serie,
                                          decoration: InputStyles.BuildInputDecoration('series'),
                                        ),
                                      )),
                                  SizedBox(width: 10),
                                  Expanded(
                                      flex: 1,
                                      child: BuildInputContainer(
                                        child: TextField(
                                          controller: _repeticao,
                                          decoration: InputStyles.BuildInputDecoration('repetições'),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(height: 14),
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
                                    onPressed: (){_adicionar(index);},
                                    child: Text('Adicionar'),
                                  )),
                            ],
                          ) : SizedBox.shrink()
                        ]
                    )
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }

  Widget ConteudoSemana(List<CategoriaTreinoDetalhado> categoria){
    return Column(
      spacing: 12,
      children: [
        ...List.generate(categoria.length, (index){

          final bool isOpen = _cardAbertoIndex == index;
          final cat = categoria[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _cardAbertoIndex = isOpen ? null : index;
                    });
                  },
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xFF14A38B),
                          borderRadius: BorderRadius.circular(10),
                          border: .all(width: 2, color: Colors.black)
                      ),
                      child: Column(
                          children: [
                            Align(
                              alignment: .bottomLeft,
                              child: TextoPadraoBold(cat.nome),
                            ),

                            isOpen ?
                            Column(
                              children: [
                                SizedBox(height: 6),
                                BuildInputContainer(
                                  child: TextField(
                                    controller: _exercicio,
                                    decoration: InputStyles.BuildInputDecoration('Digite o nome do exercicio'),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: BuildInputContainer(
                                          child: TextField(
                                            controller: _serie,
                                            decoration: InputStyles.BuildInputDecoration('series'),
                                          ),
                                        )),
                                    SizedBox(width: 10),
                                    Expanded(
                                        flex: 1,
                                        child: BuildInputContainer(
                                          child: TextField(
                                            controller: _repeticao,
                                            decoration: InputStyles.BuildInputDecoration('repetições'),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 14),
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
                                      onPressed: (){_adicionar(index);},
                                      child: Text('Adicionar'),
                                    )),
                              ],
                            ) : SizedBox.shrink()
                          ]
                      )
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }

  void _adicionar(int index) {}
}
