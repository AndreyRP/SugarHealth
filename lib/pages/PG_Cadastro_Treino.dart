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

                              SizedBox(height: 12),

                              ?VisualizarAdicionados(index)
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

                                SizedBox(height: 12),

                                ?VisualizarAdicionados(index)
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

  Widget? VisualizarAdicionados(int index) {

    // da para fazer o Switch apenas no setStatus de remover? para remover 2 retornos
    switch(_opcaoSelecionada){
      case 0:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: List<Widget>.generate(treinos[index].exercicios.length, (treinoIndex) {
                  final exercicio = treinos[index].exercicios[treinoIndex];

                  return Dismissible(
                      key: Key('${exercicio.nome}_${treinoIndex}_$index'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          treinos[index].exercicios.removeAt(treinoIndex);
                        });

                        late OverlayEntry overlayEntry;

                        overlayEntry = OverlayEntry(
                          builder: (context) => Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Material(
                              color: Colors.transparent,
                              child: Container (
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.delete_outline, color: Colors.white, size: 20),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '${exercicio.nome} removido.',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        // Insere a mensagem na camada absoluta superior do Flutter
                        Overlay.of(context).insert(overlayEntry);

                        // Remove o aviso da tela automaticamente após 2 segundos
                        Future.delayed(const Duration(seconds: 2), () {
                          overlayEntry.remove();
                        });
                      },


                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: .start,
                          children: [

                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xFFFFFFFF, 5),
                                child: Text(exercicio.nome,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                child: Center(
                                  child: Text('${exercicio.series}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                child: Center(
                                  child: Text('${exercicio.repeticoes}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: List<Widget>.generate(treinosSemana[index].exercicios.length, (treinoIndex) {
                  final exercicio = treinosSemana[index].exercicios[treinoIndex];

                  return Dismissible(
                      key: Key('${exercicio.nome}_${treinoIndex}_$index'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          treinosSemana[index].exercicios.removeAt(treinoIndex);
                        });

                        late OverlayEntry overlayEntry;

                        overlayEntry = OverlayEntry(
                          builder: (context) => Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Material(
                              color: Colors.transparent,
                              child: Container (
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.delete_outline, color: Colors.white, size: 20),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '${exercicio.nome} removido.',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        // Insere a mensagem na camada absoluta superior do Flutter
                        Overlay.of(context).insert(overlayEntry);

                        // Remove o aviso da tela automaticamente após 2 segundos
                        Future.delayed(const Duration(seconds: 2), () {
                          overlayEntry.remove();
                        });
                      },


                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: .start,
                          children: [

                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xFFFFFFFF, 5),
                                child: Text(exercicio.nome,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                child: Center(
                                  child: Text('${exercicio.seriesCadastradas}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                child: Center(
                                  child: Text('${exercicio.repeticoesCadastradas}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }),
              ),
            ],
          ),
        );
    }
  }

  void _adicionar(int index) {
    if (_serie.text.isEmpty ||
        _repeticao.text.isEmpty ||
        _exercicio.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    final int? serie = int.parse(_serie.text);
    final int? rep = int.parse(_repeticao.text);


    switch(_opcaoSelecionada){
      case 0: SalvarTreino(index, serie!, rep!, _exercicio.text);
      case 1: SalvarTreinoSemana(index, serie!, rep!, _exercicio.text);
    }

    setState(() {
      _repeticao.clear();
      _serie.clear();
      _exercicio.clear();
    });
  }

  SalvarTreino(int index, int serie, int rep, String exercicio){
      treinos[index].exercicios.add(Exercicio(nome: exercicio, series: serie, repeticoes: rep));
  }

  SalvarTreinoSemana(int index, int serie, int rep, String exercicio){
    treinosSemana[index].exercicios.add(ExercicioDetalhados(nome: exercicio, seriesCadastradas: serie, repeticoesCadastradas: rep));
  }
}
