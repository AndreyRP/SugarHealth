import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';

import '../widgets/DecoracoesStyle.dart';
import '../widgets/textos.dart';

class PgRepetirrefeicao extends StatefulWidget {
  final SuaRefeicao? refeicao;
  final List<SemanalRefeicao>? dietaSemanal;
  final List<MensalRefeicao>? dietaMensal;


  const PgRepetirrefeicao({
    super.key,
    this.refeicao,
    this.dietaSemanal,
    this.dietaMensal
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

  _adicionar({String? dia, String? refeicao}) {
    int indexDia = _semana.indexOf(dia!);
    int indexRefeicao = _refeicoes.indexOf(refeicao!);

    var listaDestino = widget.dietaSemanal![indexDia].listaDasRefeicoes[indexRefeicao].pratos;

    listaDestino.addAll(widget.refeicao!.pratos);
  }


  late final bool estaVazia = widget.refeicao?.pratos.isEmpty ?? true;

  late String? _diaSemanaTrocar = 'Segunda-Feira';
  late String? _refeicaoTrocar = 'Café da manhã';


  @override
  Widget build(BuildContext context) {


    if(estaVazia){
      return TextoTitulos('Não tem cadastro de Refeição para repetir');
    }
    return Scaffold(
        appBar: AppBar(
          title: TextoTitulos('Repetir Refeição'),
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
                              )
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
                              borderSide: const BorderSide(color: Colors.black, width: 5.0),
                            ),

                            hintText: _diaSemanaTrocar,
                            hintStyle:  TextStyle(
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

                        SizedBox(height: 12),

                        DropdownButtonFormField<String>(
                          value: _refeicaoTrocar,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(color: Colors.black, width: 5.0),
                            ),

                            hintText: _refeicaoTrocar,
                            hintStyle:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: _refeicoes.map((String refeicao) {
                            return DropdownMenuItem<String>(
                              value: refeicao,
                              child: Text(
                                refeicao,
                                style: const TextStyle(
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
                                backgroundColor: const Color(0xff97F8ED),
                                side: const BorderSide(color: Colors.black, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: const Size(220, 42),
                              ),
                              onPressed: (){_adicionar(dia: _diaSemanaTrocar, refeicao: _refeicaoTrocar);},
                              child: Text('Adicionar'),
                            )),

                      ],
                    )
                )
            )
        )
    );
  }
}
