import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';

import '../widgets/DecoracoesStyle.dart';
import '../widgets/textos.dart';

class PgRepetirrefeicao extends StatefulWidget {
  final SuaRefeicao? refeicao;
  final List<SemanalRefeicao>? dietaSemanal;
  final List<MensalRefeicao>? dietaMensal;
  final int? opcao;


  const PgRepetirrefeicao({
    super.key,
    this.refeicao,
    this.dietaSemanal,
    this.dietaMensal,
    this.opcao,
  });

  @override
  State<PgRepetirrefeicao> createState() => _PgRepetirrefeicaoState();
}

class _PgRepetirrefeicaoState extends State<PgRepetirrefeicao> {
  final List<String> _semana = [
    'Segunda-Feira',
    'Terça-Feira',
    'Quarta-Feira',
    'Quinta-Feira',
    'Sexta-Feira',
    'Sábado',
    'Domingo'
  ];
  
  final List<String> _refeicoes = [
    'Café da manhã',
    'Lanche da manhã',
    'Almoço',
    'Lanche da tarde',
    'Jantar',
    'Ceia'
  ];

  late List<dynamic> vizualizador = [];

  final List<String> _diasDoMes = List.generate(
    31,
        (index) => 'Dia ${(index + 1).toString().padLeft(2, '0')}',
  );

  int _diaMesSelecionado = 1;

  _adicionar({String? dia, String? refeicao}) {
    int indexDia = _semana.indexOf(dia!);
    int indexRefeicao = _refeicoes.indexOf(refeicao!);

    var listaDestino = widget.dietaSemanal![indexDia].listaDasRefeicoes[indexRefeicao].pratos;

    listaDestino.addAll(widget.refeicao!.pratos);

    setState(() {
      vizualizador.add({
        'dia': dia,
        'refeicao': refeicao
      });
    });
  }

  _adicionarMes({required int dia, String? refeicao}) {
    int indexRefeicao = _refeicoes.indexOf(refeicao!);
    int indexDia = dia -1;

    var listaDestino = widget.dietaMensal![indexDia].listaDasRefeicoesMes[indexRefeicao].pratos;

    listaDestino.addAll(widget.refeicao!.pratos);

    setState(() {
      vizualizador.add({
        'dia': dia.toString().padLeft(2, '0'),
        'refeicao': refeicao
      });
    });
  }


  late final bool estaVazia = widget.refeicao?.pratos.isEmpty ?? true;

  late String? _diaSemanaTrocar = 'Segunda-Feira';
  late String? _refeicaoTrocar = 'Café da manhã';


  @override
  Widget build(BuildContext context) {


    if(estaVazia){
      return Scaffold(
          appBar: AppBar(
            title: TextoTitulos('Repetir Refeição'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          backgroundColor: Color(0xffB4EAE1),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        children: [
                          TextoTitulos('Sem Pratos Registrados'),

                          SizedBox(height: 24),

                          Container(
                            padding: .symmetric(vertical: 12, horizontal: 12),
                            decoration: FundoCorBorPretas(0xffffffff, 20),
                            child: TextoPadraoBold('Não tem registro de pratos registrado nessa refeição, favor retornar '
                                'e adicionar pratos para poder repetir em outros dias'),
                          )
                        ],
                      )
                  )
              )
          )
      );
    }

    if(widget.opcao == 1){
      return Scaffold(
          appBar: AppBar(
            title: TextoTitulos('Repetir Refeição'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          backgroundColor: Color(0xffB4EAE1),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        children: [
                          TextoTitulos(widget.refeicao!.refeicao),

                          SizedBox(height: 12),

                          ...List.generate(widget.refeicao!.pratos.length, (index){
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                          decoration: FundoCorBorPretas(0xffffffff, 5),
                                          child: TextoPadraoBold(widget.refeicao!.pratos[index].nomePrato),
                                        )),
                                    SizedBox(width: 12),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                          decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                          child: TextoPadraoBold('${widget.refeicao!.pratos[index].quantidade}  ${widget.refeicao!.pratos[index].medida}'),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 8)
                              ],
                            );
                          }),

                          SizedBox(height: 12),

                          DropdownButtonFormField<String>(
                            value: _diaSemanaTrocar,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.black, width: 5.0),
                              ),
                            ),
                            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                            items: _semana.map((String semana) {
                              return DropdownMenuItem<String>(
                                value: semana,
                                child: Text(
                                  semana,
                                  style: TextStyle(
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

                          SizedBox(height: 12),

                          DropdownButtonFormField<String>(
                            value: _refeicaoTrocar,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.black, width: 5.0),
                              ),
                            ),
                            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                            items: _refeicoes.map((String refeicao) {
                              return DropdownMenuItem<String>(
                                value: refeicao,
                                child: Text(
                                  refeicao,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? Valor) {
                              if (Valor != null) {
                                setState(() {
                                  _refeicaoTrocar = Valor;
                                });
                              }
                            },
                          ),

                          SizedBox(height: 12),

                          Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff97F8ED),
                                  side: BorderSide(color: Colors.black, width: 2.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  minimumSize: Size(220, 42),
                                ),
                                onPressed: (){_adicionar(dia: _diaSemanaTrocar, refeicao: _refeicaoTrocar);},
                                child: Text('Adicionar'),
                              )),

                          SizedBox(height: 12),

                          // Mostra a lista visual das repetições adicionadas
                          Visualizar(),

                          SizedBox(height: 12),

                          // Botão de Salvar / Confirmar (Fecha a tela e devolve a dieta atualizada)
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff97F8ED),
                                side: BorderSide(color: Colors.black, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(220, 42),
                              ),
                              onPressed: () {
                                // Devolve a dieta semanal modificada para a tela anterior
                                Navigator.pop(context, widget.dietaSemanal);
                              },
                              child: Text('Salvar'),
                            ),
                          ),

                        ],
                      )
                  )
              )
          )
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: TextoTitulos('Repetir Refeição'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Color(0xffB4EAE1),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      children: [
                        TextoTitulos(widget.refeicao!.refeicao),

                        SizedBox(height: 12),

                        ...List.generate(widget.refeicao!.pratos.length, (index){
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                        decoration: FundoCorBorPretas(0xffffffff, 5),
                                        child: TextoPadraoBold(widget.refeicao!.pratos[index].nomePrato),
                                      )),
                                  SizedBox(width: 12),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                        decoration: FundoCorBorPretas(0xffA8D3F6, 5),
                                        child: TextoPadraoBold('${widget.refeicao!.pratos[index].quantidade}  ${widget.refeicao!.pratos[index].medida}'),
                                      ))
                                ],
                              ),
                              SizedBox(height: 8)
                            ],
                          );
                        }),

                        SizedBox(height: 12),

                        DropdownButtonFormField<String>(
                          value: 'Dia ${_diaMesSelecionado.toString().padLeft(2, '0')}',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: Colors.black, width: 5.0),
                            ),
                          ),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: _diasDoMes.map((String dia) {
                            return DropdownMenuItem<String>(
                              value: dia,
                              child: TextoPadraoBold(dia),
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

                        SizedBox(height: 12),

                        DropdownButtonFormField<String>(
                          value: _refeicaoTrocar,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: Colors.black, width: 5.0),
                            ),
                          ),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: _refeicoes.map((String refeicao) {
                            return DropdownMenuItem<String>(
                              value: refeicao,
                              child: TextoPadraoBold(refeicao),
                            );
                          }).toList(),
                          onChanged: (String? Valor) {
                            if (Valor != null) {
                              setState(() {
                                _refeicaoTrocar = Valor;
                              });
                            }
                          },
                        ),

                        SizedBox(height: 12),

                        Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff97F8ED),
                                side: BorderSide(color: Colors.black, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(220, 42),
                              ),
                              onPressed: (){_adicionarMes(dia: _diaMesSelecionado, refeicao: _refeicaoTrocar);},
                              child: Text('Adicionar'),
                            )),

                        SizedBox(height: 12),

                        // Mostra a lista visual das repetições adicionadas
                        Visualizar(),

                        SizedBox(height: 12),

                        // Botão de Salvar / Confirmar (Fecha a tela e devolve a dieta atualizada)
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff97F8ED),
                              side: BorderSide(color: Colors.black, width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              minimumSize: Size(220, 42),
                            ),
                            onPressed: () {
                              // Devolve a dieta semanal modificada para a tela anterior
                              Navigator.pop(context, widget.dietaMensal);
                            },
                            child: Text('Salvar'),
                          ),
                        ),

                      ],
                    )
                )
            )
        )
    );

  }

  Widget Visualizar(){
    return Column(
      children: [
        ...List.generate(vizualizador.length, (index){
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: FundoCorBorPretas(0xffffffff, 5),
                        child: TextoPadrao(vizualizador[index]['dia']),
                      )
                  ),
                  SizedBox(width: 12),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: FundoCorBorPretas(0xffffffff, 5),
                        child: TextoPadrao(vizualizador[index]['refeicao']),
                      )
                  )
                ],
              ),
              SizedBox(height: 8)
            ],
          );
        })
      ],
    );
  }
}


