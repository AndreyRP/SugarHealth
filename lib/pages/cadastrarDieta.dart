import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';
import 'package:sugarhealth/pages/PG_ConfirmacaoGravar.dart';
import 'package:sugarhealth/pages/PG_RepetirRefeicao.dart';
import 'package:sugarhealth/widgets/DecoracoesStyle.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../widgets/createBoxInput.dart';
import '../widgets/inputDecoration.dart';

class Cadastrardieta extends StatefulWidget {
  const Cadastrardieta({super.key});

  @override
  State<Cadastrardieta> createState() => _CadastrardietaState();
}

// --- Tela de Cadastro de Dieta ---

class _CadastrardietaState extends State<Cadastrardieta> {
  bool _isAvisoOpen = false;

  // --- Cria refeiçao para visualizar ---
  SuaRefeicao CriarSuaRefeicao(int index){
    SuaRefeicao refeicao = refeicaoDiaria[index];
    return refeicao;
  }

  SuaRefeicao CriarSuaRefeicaoSemanal(int index, String dia){
    int indexDia = _semana.indexOf(dia);
    SuaRefeicao refeicao = diaDaSemana[indexDia].listaDasRefeicoes[index];
    return refeicao;
  }

  SuaRefeicao CriarSuaRefeicaoMensal(int index, int dia){
    SuaRefeicao refeicao = dietaMensal[dia - 1].listaDasRefeicoesMes[index];
    return refeicao;
  }

  // --- Cadastro de Refeicao ---
  final TextEditingController _refeicao = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  String? _medida;
  final List<String> medidas = ['G', 'ML'];

   _adicionar(int index, {String? dia, int? diaMes}) {
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
      case 1: SalvarRefeicaoSemanal(dia!, index, _refeicao.text, quantidade, _medida!);
      case 2: SalvarRefeicaoMensal(diaMes!, index, _refeicao.text, quantidade, _medida!);
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

  SalvarRefeicaoSemanal(String dia, int index, String refeicao, double quantidade, String medida){
    int indexDia = _semana.indexOf(dia);
    var prato = Prato(refeicao, quantidade, medida);
    diaDaSemana[indexDia].listaDasRefeicoes[index].pratos.add(prato);
  }

  SalvarRefeicaoMensal(int diaDoMes, int index, String refeicao, double quantidade, String medida) {
    // Encontra o dia específico do mês (1 a 31)
    var prato = Prato(refeicao, quantidade, medida);

    int dia = diaDoMes -1;
    // Adiciona o prato no dia correspondente do mês
    dietaMensal[dia].listaDasRefeicoesMes[index].pratos.add(prato);
  }

  // --- Controle de Menu ---
  int? _opcaoSelecionada = 0;

  final List<String> _opcoes = ['Diaria', 'Semanal', 'Mensal'];

  Widget _carregarConteudo() {
    switch (_opcaoSelecionada) {
      case 0:
        return RefeicaoDiaria();
      case 1:
        return RefeicaoSemanal();
      case 2:
        return RefeicaoMensal();
      default:
        return const Center(child: Text('Nenhuma opção selecionada'));
    }
  }

  int? _cardAbertoIndex = null;

  // --- controle do modo mensal ---

  final List<String> _diasDoMes = List.generate(
    31,
        (index) => 'Dia ${(index + 1).toString().padLeft(2, '0')}',
  );

  int _diaMesSelecionado = 1; // Guarda o dia do mês (1 a 31)


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

  final List<SemanalRefeicao> diaDaSemana = [
    SemanalRefeicao(0, [
      SuaRefeicao('Café da manhã', []),
      SuaRefeicao('Lanche da manhã', []),
      SuaRefeicao('Almoço', []),
      SuaRefeicao('Lanche da tarde', []),
      SuaRefeicao('Jantar', []),
      SuaRefeicao('Ceia', []),
    ]),
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
  ];

  final List<SuaRefeicao> refeicaoDiaria = [
    SuaRefeicao('Café da manhã', []),
    SuaRefeicao('Lanche da manhã', []),
    SuaRefeicao('Almoço', []),
    SuaRefeicao('Lanche da tarde', []),
    SuaRefeicao('Jantar', []),
    SuaRefeicao('Ceia', []),
  ];

  final List<MensalRefeicao> dietaMensal = List.generate(
    31,
        (index) => MensalRefeicao(
       index + 1,
          [
        SuaRefeicao('Café da manhã', []),
        SuaRefeicao('Lanche da manhã', []),
        SuaRefeicao('Almoço', []),
        SuaRefeicao('Lanche da tarde', []),
        SuaRefeicao('Jantar', []),
        SuaRefeicao('Ceia', []),
      ],
    ),
  );

  late String? _diaSemanaTrocar = 'Segunda-Feira';

  // --- Carrega Sub Menus ---



  @override
Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BordasTransparentes(),

      // --- Sub Menus ---
      child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: FundoCorBorPretas(0xffBCEAE5, 20),
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

Widget _carregaSubMenu() {

    if (_opcaoSelecionada == 0) {
      return const SizedBox.shrink();
    }

    if (_opcaoSelecionada == 1) {
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
                    });
                  }
                },
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        // Dropdown para escolher o Dia do Mês (Dia 01 a Dia 31)
        Row(
          children: [
            Expanded(
              child: BuildInputContainer(
                child: DropdownButtonFormField<String>(
                  value: 'Dia ${_diaMesSelecionado.toString().padLeft(2, '0')}',
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  items: _diasDoMes.map((String dia) {
                    return DropdownMenuItem<String>(
                      value: dia,
                      child: Text(
                        dia,
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
                        _diaMesSelecionado = int.parse(novoValor.replaceAll('Dia ', ''));
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // --- Ícone de Alerta clicável
        GestureDetector(
          onTap: () {
            setState(() {
              _isAvisoOpen = !_isAvisoOpen; 
            });
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFF856404),
                  size: 24,
                ),
                SizedBox(width: 6),
                Text(
                  'Aviso sobre o Plano Mensal',
                  style: TextStyle(
                    color: Color(0xFF856404),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        // --- Transição animada da caixa de aviso
        AnimatedCrossFade(
          firstChild: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3CD),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFC107), width: 1.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xFF856404),
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Atenção: O plano mensal salva 31 registros independentes que não consideram os dias específicos de cada mês. Para alterar a dieta de um dia, será necessário reescrever seu registro individual.',
                    style: TextStyle(
                      color: Color(0xFF856404),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAvisoOpen = false;
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF856404),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          secondChild: const SizedBox.shrink(),
          crossFadeState: _isAvisoOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 250),
        ),
      ],
    );
  }

Widget? ConteinerAdicionarPrato(int index, {String? dia, int? diaMes}){
    // tem como colocar o switch no Onpress, que chama a funçao adicionar?
    switch(_opcaoSelecionada) {
      case 0:
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
            ]
        );
      case 1:
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
                    onPressed: (){_adicionar(index, dia: _diaSemanaTrocar);},
                    child: Text('Adicionar'),
                  )),
            ]
        );
      case 2:
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
                    onPressed: (){_adicionar(index, diaMes: _diaMesSelecionado);},
                    child: Text('Adicionar'),
                  )),
            ]
        );
    }
}

Widget? VisualizarAdicionados(SuaRefeicao refeicao, int index) {

  int indexDia = _semana.indexOf(_diaSemanaTrocar!);
// da para fazer o Switch apenas no setStatus de remover? para remover 2 retornos
  switch(_opcaoSelecionada){
      case 0:
        return Container(
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
                                decoration: FundoCorBorPretas(0xFFFFFFFF, 5),
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
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
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
      case 1:
        return Container(
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
                          diaDaSemana[indexDia].listaDasRefeicoes[index].pratos.removeAt(pratoIndex);
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
                                decoration: FundoCorBorPretas(0xffffffff, 5),
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
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
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
      case 2:
        return Container(
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
                              dietaMensal[_diaMesSelecionado - 1].listaDasRefeicoesMes[index].pratos.removeAt(pratoIndex);
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
                                decoration: FundoCorBorPretas(0xffffffff, 5),
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
                                decoration: FundoCorBorPretas(0xffA8D3F6, 5),
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

Widget RefeicaoDiaria(){

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: FundoCorBorPretas(0xffffffff, 30),
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
                        decoration: FundoCorBorPretas(0xffBCEAE5, 20),
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
                              ?ConteinerAdicionarPrato(index),
                              SizedBox(height: 12),
                              ?VisualizarAdicionados(CriarSuaRefeicao(index), index)
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

Widget RefeicaoSemanal(){

  return Container(
      padding: const EdgeInsets.all(16),
      decoration: FundoCorBorPretas(0xffffffff, 30),
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
                      decoration: FundoCorBorPretas(0xffBCEAE5, 20),
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
                            ?ConteinerAdicionarPrato(index, dia: _diaSemanaTrocar!),
                            SizedBox(height: 12),
                            ?VisualizarAdicionados(CriarSuaRefeicaoSemanal(index, _diaSemanaTrocar!), index),
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
                                      MaterialPageRoute(builder: (context) => PgRepetirrefeicao(refeicao: CriarSuaRefeicaoSemanal(index, _diaSemanaTrocar!)),
                                    )).then((_) {
                                      setState(() {});
                                    });
                                  },
                                  child: TextoPadrao('Repetir refeição'),
                                ))
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PgConfirmacaogravar(opcao: _opcaoSelecionada!, dietaSemanal: diaDaSemana)),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                  child: Text('Salvar'),
                ))
          ]
      )
  );
}

Widget RefeicaoMensal(){

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: FundoCorBorPretas(0xffffffff, 30),
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
                        decoration: FundoCorBorPretas(0xffBCEAE5, 20),
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
                              ?ConteinerAdicionarPrato(index, diaMes: _diaMesSelecionado),
                              SizedBox(height: 12),
                              ?VisualizarAdicionados(CriarSuaRefeicaoMensal(index, _diaMesSelecionado), index)
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PgConfirmacaogravar(opcao: _opcaoSelecionada!, dietaMensal: dietaMensal)),
                      ).then((_) {
                        setState(() {});
                      });
                    },
                    child: Text('Salvar'),
                  )),

              // --- Botões de Importação e Exportação (Estrutura UI) ---
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // Botão Exportar Modelo
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.black, width: 2.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                onPressed: () {
                                  // Futura implementação: Download/Exportação do modelo CSV/XML
                                },
                                icon: const Icon(Icons.file_download_outlined, color: Colors.black, size: 20),
                                label: const Text(
                                  'Exportar Modelo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                          )
                        ],
                      )
                    ),

                    const SizedBox(height: 10),

                    // Botão Importar Dieta
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff97F8ED),
                              side: const BorderSide(color: Colors.black, width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              elevation: 0,
                            ),
                            onPressed: () {
                              // Futura implementação: Leitura do arquivo CSV/XML
                            },
                            icon: const Icon(Icons.file_upload_outlined, color: Colors.black, size: 20),
                            label: const Text(
                              'Importar Dieta',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),)
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }

}
