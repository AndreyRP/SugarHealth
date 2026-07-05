import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';

import '../main.dart';
import 'createBoxInput.dart';
import 'inputDecoration.dart';

class Cadastrardieta extends StatefulWidget {
  const Cadastrardieta({super.key});

  @override
  State<Cadastrardieta> createState() => _CadastrardietaState();
}

class _CadastrardietaState extends State<Cadastrardieta> {

  // --- Cria refeiçao para visualizar ---
  SuaRefeicao CriarSuaRefeicao(int index){
    SuaRefeicao refeicao = refeicaoDiaria[index];
    return refeicao;
  }

  // --- Cadastro de Refeicao ---
  final TextEditingController _refeicao = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  String? _medida;
  final List<String> medidas = ['G', 'ML'];

   _adicionar(int index) {
    if (_refeicao.text.isEmpty ||
        _quantidade.text.isEmpty ||
        _medida == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    final double? quantidade = double.tryParse(_quantidade.text);

    if (quantidade == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira uma quantidade válida!')),
      );
      return;
    }

    switch(_opcaoSelecionada){
      case 0: SalvarRefeicaoDiaria(index, _refeicao.text, quantidade, _medida!);
      case 1: ;
      case 2: ;
    }

    setState(() {
      _refeicao.clear();
      _quantidade.clear();
      _medida = null;
    });
  }

  SalvarRefeicaoDiaria(int index, String refeicao, double quantidade, String medida){

    var prato = Prato(refeicao, quantidade, medida);
     refeicaoDiaria[index].pratos.add(prato);
  }

  // --- Controle de Menu ---
  int? _opcaoSelecionada = 0;

  final List<String> _opcoes = ['Diaria', 'Semanal', 'Mensal'];

  Widget _carregarConteudo() {
    switch (_opcaoSelecionada) {
      case 0:
        return RefeicaoDiaria();
      case 1:
        return RefeicaoDiaria();
      case 2:
        return RefeicaoDiaria();
      default:
        return const Center(child: Text('Nenhuma opção selecionada'));
    }
  }
  int? _cardAbertoIndex = null;


  // --- Controle de Semana, Mes, Dia ---
  final List<String> _semana = [
    'Segunda-Feira',
    'Terça-Feira',
    'Quarta-Feira',
    'Quinta-Feira',
    'Sexta-Feira',
    'Sábado',
    'Domingo'
  ];

  late var SelecaoDiaSemana = _semana[0];

  final List<SemanalRefeicao> DiaDaSemana = [
    SemanalRefeicao(1, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(2, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(3, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(4, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(5, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(6, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
    SemanalRefeicao(7, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
  ];

  final List<SuaRefeicao> refeicaoDiaria = [
    SuaRefeicao('Café da manhã', []),
    SuaRefeicao('Lanche da manhã', []),
    SuaRefeicao('Almoço', []),
    SuaRefeicao('Lanche da tarde', []),
    SuaRefeicao('Jantar', []),
    SuaRefeicao('Ceia', []),
  ];

  late String? _diaSemanaTrocar = 'Segunda-Feira';


  String _conferteSemanaEmNumero(String dia) {
    switch (dia) {
      case 'Segunda-Feira': return _semana[0];
      case 'Terça-Feira':   return _semana[1];
      case 'Quarta-Feira':  return _semana[2];
      case 'Quinta-Feira':  return _semana[3];
      case 'Sexta-Feira':   return _semana[4];
      case 'Sábado':        return _semana[5];
      case 'Domingo':       return _semana[6];
      default:              return _semana[0];
    }
  }

  // --- Carrega Sub Menus ---

  Widget _carregaSubMenu() {
    if (_opcaoSelecionada == 0) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          child: BuildInputContainer(
            child: DropdownButtonFormField<String>(
              value: _diaSemanaTrocar,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: _diaSemanaTrocar,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              items: _semana.map((String semana) {
                return DropdownMenuItem<String>(
                  value: semana,
                  child: Text(
                    semana,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? novoValor) {
                if (novoValor != null) {
                  setState(() {
                    _diaSemanaTrocar = novoValor;
                    SelecaoDiaSemana = _conferteSemanaEmNumero(novoValor);
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),

      // --- Sub Menus ---
      child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xffBCEAE5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
          Row(
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
          )),

          SizedBox(height: 20),

          _carregaSubMenu(),

          SizedBox(height: 20),

          _carregarConteudo(),
        ]
      )
    );

}

  Widget RefeicaoDiaria(){

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          children: [
            Column(
              children: List<Widget>.generate(refeicaoDiaria.length, (int index) {
                final bool isOpen = _cardAbertoIndex == index;
                final SuaRefeicao refeicaoAtual = refeicaoDiaria[index];

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
                            ConteinerAdicionarPrato(index)
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),

            SizedBox(height: 16),

            // --- botao Salvar ---
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
                onPressed: (){},
                child: Text('Salvar'),
    ))
          ]
        )
    );
}

Widget ConteinerAdicionarPrato(int index){
  return Column(
      children: [
        BuildInputContainer(
          child: TextField(
            controller: _refeicao,
            decoration: InputStyles.BuildInputDecoration('Digite o prato'),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: BuildInputContainer(
                  child: TextField(
                    controller: _quantidade,
                    decoration: InputStyles.BuildInputDecoration('Digite a quantidade'),
                  ),
                )),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: BuildInputContainer(
                child: DropdownButtonFormField<String>(
                  value: _medida,
                  decoration: InputStyles.BuildInputDecoration(''),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  items: medidas.map((String tipo) {
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(
                        tipo,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? novoValor) {
                    setState(() {
                      _medida = novoValor;
                    });
                  },
                ),
              ),)

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

        VisualizarAdicionados(CriarSuaRefeicao(index), index)
      ]
  );
}
  Widget VisualizarAdicionados(SuaRefeicao refeicao, int index) {
    return Container(
      color: const Color(0xffBCEAE5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: List<Widget>.generate(refeicao.pratos.length, (pratoIndex) {
              final prato = refeicao.pratos[pratoIndex];

              return Dismissible(
                  key: Key('${prato.nomePrato}_${pratoIndex}_$index'),
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
                      refeicaoDiaria[index].pratos.removeAt(pratoIndex);
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
                                    '${prato.nomePrato} removido.',
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(prato.nomePrato,
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
                            decoration: BoxDecoration(
                              color: Color(0xffA8D3F6),
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text('${prato.quantidade} ${prato.medida}',
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



